import glob
import subprocess
import tempfile
import psutil

from django.shortcuts import render, HttpResponseRedirect, HttpResponse
from bbs import models
from django.contrib.auth import login, logout, authenticate
from django.contrib.auth.decorators import login_required
from bbs import comment_handler
# 钩子
from bbs.Myforms import UserForm
from bbs import form
import json
from bbs.models import UserProfile
from django.http import JsonResponse
from bbs.untils.valid_code import get_code_img

from django.contrib.auth.models import User

import os, random, time, sys

category_list = models.Category.objects.filter(set_as_top_menu=True).order_by("position_index")

def index(request):
    if request.method == 'POST':
        key = request.POST.get('key')
        article_list = models.Article.objects.filter(title__icontains=key)
    else:
        article_list = models.Article.objects.filter(status="published")
    return render(request, "bbs/index.html", {"category_list": category_list,
                                              "article_list": article_list})


def category(request, category_id):
    category_obj = models.Category.objects.get(id=category_id)
    article_list = models.Article.objects.filter(category_id=category_obj.id, status="published")
    return render(request, "bbs/index.html", {"category_list": category_list,
                                              "category_obj": category_obj,
                                              "article_list": article_list})

def problem_set(request):
    problem_set_list = models.Problem.objects.all()
    return render(request, "bbs/problem_set.html", {"problem_set_list": problem_set_list})


def acc_login(request):
    if request.method == 'POST':
        data = request.POST
        user = data.get('user')
        pwd = data.get('pwd')
        user = authenticate(username=user, password=pwd)
        if not user:
            return JsonResponse({
                'result': "用户名或密码不正确"
            })
        login(request, user)
        return JsonResponse({
            'result': "success"
        })
    else:
        return render(request, 'index.html')

def acc_logout(request):
    user = request.user
    if not user.is_authenticated:
        return JsonResponse({
            'result': "success",
        })
    logout(request)
    return render(request, 'index.html')
    return JsonResponse({
        'result': "success",
    })


def article_detail(request, article_id):
    article_obj = models.Article.objects.get(id=article_id)
    comment_handler.build_tree(article_obj.comment_set.select_related())

    return render(request, "bbs/article.html", {"article_obj": article_obj,
                                                "category_list": category_list, })
def problem_detail(request, problem_id):
    problem_obj = models.Problem.objects.get(problem_number=problem_id)
    return render(request, "bbs/problem.html", {"problem_obj": problem_obj})

def comment(request):
    if request.method == "POST":

        new_comment_obj = models.Comment(
            article_id=request.POST.get("article_id"),
            parent_comment_id=request.POST.get("parent_comment_id", None),
            comment_type=request.POST.get("comment_type"),
            user_id=request.user.userprofile.id,
            comment=request.POST.get("comment_content"),
        )
        new_comment_obj.save()
        return HttpResponse("success")

def get_comments(request, article_id):
    article_obj = models.Article.objects.get(id=article_id)
    comment_tree = comment_handler.build_tree(article_obj.comment_set.select_related())
    tree_html = comment_handler.render_comment_tree(comment_tree)
    return HttpResponse(tree_html)

@login_required
def new_article(request):
    if request.method == "POST":
        article_form = form.ArticleModelForm(request.POST, request.FILES)
        if article_form.is_valid():
            data = article_form.cleaned_data
            data['author_id'] = request.user.userprofile.id
            article_obj = models.Article(**data)
            article_obj.save()
            return HttpResponseRedirect("/bbs/")
        else:
            return render(request, "bbs/new_article.html", {"category_list": category_list,
                                                            "article_form": article_form, })
    article_form = form.ArticleModelForm()
    return render(request, "bbs/new_article.html", {"category_list": category_list,
                                                    "article_form": article_form, })


def get_latest_article_count(request):
    latest_article_id = request.GET.get("latest_id")
    if latest_article_id:
        new_article_count = models.Article.objects.filter(id__gt=latest_article_id).count()
    else:
        new_article_count = 0
    return HttpResponse(json.dumps({"new_article_count": new_article_count}))


def register(request):
    if request.method == "POST":
        form = UserForm(request.POST)
        response = {'user': None, 'msg': None}
        if form.is_valid():
            response['user'] = form.cleaned_data.get('user')
            user = form.cleaned_data.get('user')
            pwd = request.POST.get('pwd')
            email = request.POST.get('email')
            avatar_obj = request.FILES.get('avatar')
            # 判断用户是否上传头像来确定是否走默认值
            # 进行优化
            # if avatar_obj:
            #     user_obj = UserInfo.objects.create_user(username=user, password=pwd, email=email, avatar=avatar_obj)
            # else:
            #     user_obj = UserInfo.objects.create_user(username=user, password=pwd, email=email)

            extra = {}
            if avatar_obj:
                extra['head_img'] = avatar_obj

            user = User.objects.create_user(username=user, password=pwd, email=email, **extra)
            UserProfile.objects.create(user=user, username=user.username, signature="")
        else:

            response['msg'] = form.errors

        return JsonResponse(response)
    form = UserForm()
    return render(request, 'register.html', locals())


def get_validcode_img(request):
    img_data = get_code_img(request)
    return HttpResponse(img_data)

def not_found(request):
    return render(request, 'not_found.html')

def commit_test_code(request):
    data = request.POST

    language = data.get('language')
    code = data.get('code')
    input = data.get('input')

    result = get_compile_result(language, code, input)

    return JsonResponse({
        'output': result["output"],
        'state': result["code"]
    })

PROBLEM_DATA_TEST_ROOT = "C:\\Users\\暗杀星\\Desktop\\problem_judge_data"

def judge(request):
    data = request.POST
    language = data.get('language')
    code = data.get('code')
    problem_number = data.get('problem_number')
    problem_test_data = PROBLEM_DATA_TEST_ROOT + "\\" + problem_number + "\\"
    problem_obj = models.Problem.objects.get(problem_number=problem_number)
    time_limit = problem_obj.time_limit
    space_limit = problem_obj.space_limit
    status = ''

    file_nums = glob.glob(problem_test_data + '*.in')

    for i in range(len(file_nums)):
        input = open(problem_test_data + str(i) + ".in", 'r').read()
        result = get_compile_result(language, code, input)
        output = open(problem_test_data + str(i) + ".out", 'r').read()

        if result['code'] == "Error":
            status = "Compile Error"
            output = result['output'].replace("C:\\Users\\暗杀星\\AppData\\Local\\Temp\\python_", "").strip()
            result['time'] = 0
        elif result['code'] == "Time Out Error":
            status = "Time Limit Exceeded"
            result['time'] = 0
            break

        elif result['code'] != "Error":
            result['output'] = result['output'].replace("\n", "").replace("\r", "")
            output = output.replace("\n", "").replace("\r", "")
            if result['output'] != output:
                status = "Wrong Answer"
                break
            elif result['time'] > time_limit:
                status = "Time Limit Exceeded"
                break
            elif result['memory'] > space_limit:
                status = "Memory Limited Exceeded"
                break

    if status == '':
        status = "Accept"
        output = ""
    return JsonResponse({
        "status": status,
        "output": result['output'],
        "time": result['time'] * 1000 // 1
    })


# Java 静态变量
Java_TempFile = tempfile.mkdtemp(suffix='_test', prefix='java_')  # 创建临时文件夹,返回临时文件夹路径
JAVAC_EXEC = "C:\\Program Files\\Java\\jdk1.8.0_201\\bin\\javac"  # javac 和 Java 编译器位置
JAVA_EXEC = "C:\\Program Files\\Java\\jdk1.8.0_201\\bin\\java"

# Python 静态变量
Python_TempFile = tempfile.mkdtemp(suffix='_test', prefix='python_')  # 创建临时文件夹,返回临时文件夹路径
Python_FileNum = int(time.time()*1000)  # Python文件名
EXEC = sys.executable  # python编译器位置

# C++ 静态变量
# C:\TDM-GCC-64\bin C:\TDM-GCC-64\bin
C_Plus_TempFile = tempfile.mkdtemp(suffix='_test', prefix='c++_')
C_PLUS_EXEC = "C:\\TDM-GCC-64\\bin\\g++"

def generate_filename():  # 随机生成类名
    filename = ''
    H = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'
    for i in range(4):
        filename += random.choice(H)
    return filename

def write_code_file(code, filename, language):
    if language == "Java":
        code_filepath = os.path.join(Java_TempFile, '%s.java' % filename)
        with open(code_filepath, 'w', encoding='utf-8') as f:
            f.write(code)
    elif language == "Python":
        code_filepath = os.path.join(Python_TempFile, '%s.py' % filename)
        with open(code_filepath, 'w', encoding='utf-8') as f:
            f.write(code)
    elif language == "C++":
        code_filepath = os.path.join(Python_TempFile, '%s.cpp' % filename)
        with open(code_filepath, 'w', encoding='utf-8') as f:
            f.write(code)
    return code_filepath

def write_input_file(input, filename):  # 接收输入写入文件
    input_filepath = os.path.join(Java_TempFile, '%s.txt' % filename)
    with open(input_filepath, 'w', encoding='utf-8') as f:
        f.write(input)
        return input_filepath

def decode(s):  # 编码
    try:
        return s.decode('utf-8')
    except UnicodeDecodeError:
        return s.decode('gbk')

def java_main(code, code_filename, code_filepath, input, input_filename, input_filepath):  # 主执行函数
    result = dict()
    try:
        pid = os.getpid()
        p = psutil.Process(pid)

        start = time.time()
        info_start = p.memory_full_info().uss // 1024
        outdata = decode(subprocess.check_output([JAVAC_EXEC, code_filepath], stdin=open(input_filepath, 'r'), stderr=subprocess.STDOUT, timeout=5))
        info_end = p.memory_full_info().uss // 1024
        end = time.time()
    except subprocess.TimeoutExpired as time_e:
        result['time'] = time_e
        result['code'] = "Time Out Error"
        result['output'] = ""
        return result
    except subprocess.CalledProcessError as e:
        result["code"] = 'Error'
        result["output"] = decode(e.output)
        return result
    else:
        pid = os.getpid()
        p = psutil.Process(pid)

        start = time.time()
        info_start = p.memory_full_info().uss // 1024
        outdata = decode(subprocess.check_output(["C:\\Users\\暗杀星\\Desktop\\test.bat", Java_TempFile, JAVA_EXEC, "Main"],stdin=open(input_filepath, 'r'), stderr=subprocess.STDOUT, timeout=20))
        info_end = p.memory_full_info().uss // 1024
        end = time.time()

        result['memory'] = info_end - info_start
        result['time'] = end - start
        # 成功返回的数据
        result['output'] = outdata
        result["code"] = "Success"
        result['time'] = end - start
        print(outdata)
        return result

def python_main(code, code_filename, code_filepath, input, input_filename, input_filepath): # python主执行函数
    r = dict()
    try:
        pid = os.getpid()
        p = psutil.Process(pid)

        start = time.time()
        info_start = p.memory_full_info().uss // 1024
        outdata = decode(subprocess.check_output([EXEC, code_filepath], stdin=open(input_filepath, 'r'), stderr=subprocess.STDOUT, timeout=5))
        info_end = p.memory_full_info().uss // 1024
        end = time.time()
        r['memory'] = info_end - info_start
        r['time'] = end - start
    except subprocess.TimeoutExpired as time_e:
        r['time'] = time_e
        r['code'] = "Time Out Error"
        r['output'] = ""
        return r
    except subprocess.CalledProcessError as e:
        # e.output是错误信息标准输出
        # 错误返回的数据
        r["code"] = 'Error'
        r["output"] = decode(e.output)
        return r
    else:
        # 成功返回的数据
        r['output'] = outdata
        print(outdata)
        r["code"] = "Success"
        return r
    finally:
        try:
            os.remove(code_filepath)
        except Exception as e:
            exit(1)

def c_plus_main(code, code_filename, code_filepath, input, input_filename, input_filepath):
    result = dict()
    try:
        pid = os.getpid()
        p = psutil.Process(pid)

        start = time.time()
        info_start = p.memory_full_info().uss // 1024
        outdata = decode(subprocess.check_output([C_PLUS_EXEC, code_filepath], stdin=open(input_filepath, 'r'),
                                                 stderr=subprocess.STDOUT, timeout=5))
        info_end = p.memory_full_info().uss // 1024
        end = time.time()
        result['memory'] = info_end - info_start
        result['output'] = outdata

        result['time'] = end - start
    except subprocess.TimeoutExpired as time_e:
        result['time'] = time_e
        result['code'] = "Time Out Error"
        result['output'] = ""
        return result
    except subprocess.CalledProcessError as e:
        result["code"] = 'Error'
        result["output"] = decode(e.output)
        return result
    else:
        # 因为调用原因，bat写绝对路径
        pid = os.getpid()
        p = psutil.Process(pid)

        start = time.time()
        info_start = p.memory_full_info().uss // 1024
        outdata = decode(
            subprocess.check_output(["C:\\Users\\暗杀星\\Desktop\\touch.bat", C_Plus_TempFile, C_PLUS_EXEC, code_filepath],
                                    stdin=open(input_filepath, 'r'),
                                    stderr=subprocess.STDOUT, timeout=5))
        info_end = p.memory_full_info().uss // 1024

        end = time.time()
        result['memory'] = info_end - info_start
        # 成功返回的数据
        result['output'] = outdata
        result["code"] = "Success"
        result['time'] = end - start
        return result

def get_compile_result(language, code, input): # 获取编译后的结果
    code_filename = generate_filename()
    code_filepath = write_code_file(code, code_filename, language)
    input_filename = 'input'
    input_filepath = write_input_file(input, input_filename)
    if language == 'Java':
        print('java')
        result = java_main(code, code_filename, code_filepath, input, input_filename, input_filepath)
        return result
    elif language == 'C++':
        print('c++')
        result = c_plus_main(code, code_filename, code_filepath, input, input_filename, input_filepath)
        return result
    elif language == 'Python':
        print('python')
        result = python_main(code, code_filename, code_filepath, input, input_filename, input_filepath)
        return result

def editor(request):
    return render(request, template_name="templates/bbs/editor.html")

def thumb(request):
    data = request.POST
    article_id = data.get('article_id')
    username = data.get('username')
    article_obj = models.Article.objects.get(id=article_id)
    users_thumbs = str(article_obj.users_thumb).strip().split(' ')
    users_liked = len(users_thumbs)
    print(users_thumbs)
    if username in users_thumbs:
        print(11)
        users_thumbs = str(article_obj.users_thumb).strip().split(' ')
        users_liked = len(users_thumbs)
        for u in users_thumbs:
            if u == username:
                users_thumbs.remove(u)

        users_liked -= 1;
        print("users_liked", users_liked)
        users_thumb = ''
        for u in users_thumbs:
            users_thumb += u + ' '
        print(users_thumb)
        article_obj.users_thumb = users_thumb.strip()
        article_obj.users_liked = users_liked
    else:
        print(22)

        users_thumbs = str(article_obj.users_thumb).strip().split(' ')
        if '' in users_thumbs:
            users_thumbs.remove('')

        users_liked = len(users_thumbs)
        users_liked += 1
        print('users_liked', users_liked)
        article_obj.users_liked = users_liked
        users_thumb = ''
        for user in users_thumbs:
            users_thumb += user + ' '
        users_thumb += username
        print(users_thumb.strip())
        article_obj.users_thumb = users_thumb.strip()
        article_obj.users_liked = users_liked
    article_obj.save()
    return JsonResponse({
        "users_liked": users_liked
    })