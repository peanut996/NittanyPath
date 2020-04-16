# NittanyPath

## 技术栈

+ Django

## Requirements

+ Python >= 3.7
+ MySQL >= 5.7

## 安装方法

```bash
git clone https://github.com/peanut996/NittanyPath.git
cd NittanyPath/

# 生成虚拟环境
python -m venv venv

# 激活虚拟环境
source venv/bin/activate #Unix/MacOS用户
venv\Scripts\activate.bat #Windows用户

# 安装依赖(二选一)
pip install --no-index --find-links=packages -r requirements.txt  #离线安装依赖
pip install -r requirements.txt  #在线安装依赖
```

## 数据库配置

请按照`sql/nittanypath.sql`文件导入，生成对应的数据库(MySQL或者MariaDB),并修改`nittanypath/nittanypath/settings.py`中配置为自己的数据库配置,如果使用`nodjango.sql`则需要手动迁移一次`python manage.py migrate`生成关键表

```python
DATABASES = {
        'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'nittanypath',
        'USER': '**your account**',
        'PASSWORD': '**your password**',
        'HOST':'127.0.0.1',
        'PORT': '3306',
    }
}
```

## 运行

虚拟环境中进入`nittanypath`文件夹：

```python
python manage.py runserver
```

之后进入`http://localhost:8000/`查看即可

## 账号

`data`文件夹包含测试数据  
admin账号`root`，密码`123`
