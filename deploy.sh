cd ~/myproject
cat > deploy.sh << 'EOF'
#!/bin/bash
set -e
test -f index.html
cp index.html /var/www/html/index.html
curl -sf http://localhost/ | grep "My Project"
echo "Website deployed"
EOF
chmod +x deploy.sh
