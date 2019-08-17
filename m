Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F1E990D93
	for <lists+linux-rtc@lfdr.de>; Sat, 17 Aug 2019 08:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbfHQG4n (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 17 Aug 2019 02:56:43 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:51946 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725832AbfHQG4n (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 17 Aug 2019 02:56:43 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7H6rkhg051043;
        Sat, 17 Aug 2019 06:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=4xPc7OH03Qeh9EEBQIHWiTpUV95grQ6Z7qmeUrKMVG0=;
 b=Wwwaz8R2N5fmwk1zSVdU1rEm6WTQMW3OO/Dv+Ma2/72OrYbmQEg1XuIjg0zyI9DCUZnP
 zFk5979UacELNqSGXDu/tnxXQ4waXla0/96CooIT+/trVoT2fcqEyAVV7OWKGmRQrC7/
 MzpI2yqAXC1at897I/Eb0UCzXcSXwwTCOsZIHBl1IORt+YHd3kPFskGasbZIAQF98afY
 RfYGANYDbY8ND9Ri9o4uS7fZBS5PdD4Rc9TZfzPHsr5KnIPewuMcxdWp1KJG6bo8rWrE
 JdFcucnaoPJlGvJQ3TMV/X3fH0jCoxQkyoXB9N0DNMt85viDvdr2BshcDCQ4KD7d+6GE Pg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 2ue9hp0hhx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 17 Aug 2019 06:56:20 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7H6s3Ps117026;
        Sat, 17 Aug 2019 06:56:20 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 2ue8wwd5ag-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 17 Aug 2019 06:56:19 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x7H6uBgs032722;
        Sat, 17 Aug 2019 06:56:13 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 16 Aug 2019 23:56:10 -0700
Date:   Sat, 17 Aug 2019 09:56:04 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Tom Evans <tom.evans@motec.com.au>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] rtc: rv3029: Revert my error handling patch to
 rv3029_eeprom_write()
Message-ID: <20190817065604.GB29951@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9351 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908170074
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9351 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908170074
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

My error handling "cleanup" was totally wrong.  Both the "err" and "ret"
variables are required.  The "err" variable holds the error codes for
rv3029_eeprom_enter/exit() and the "ret" variable holds the error codes
for if actual write fails.  In my patch if the write failed, the
function probably still returned success.

Reported-by: Tom Evans <tom.evans@motec.com.au>
Fixes: 97f5b0379c38 ("rtc: rv3029: Clean up error handling in rv3029_eeprom_write()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/rtc/rtc-rv3029c2.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-rv3029c2.c b/drivers/rtc/rtc-rv3029c2.c
index 4a0e8ec015cc..4cdf6588e1d9 100644
--- a/drivers/rtc/rtc-rv3029c2.c
+++ b/drivers/rtc/rtc-rv3029c2.c
@@ -278,13 +278,13 @@ static int rv3029_eeprom_read(struct device *dev, u8 reg,
 static int rv3029_eeprom_write(struct device *dev, u8 reg,
 			       u8 const buf[], size_t len)
 {
-	int ret;
+	int ret, err;
 	size_t i;
 	u8 tmp;
 
-	ret = rv3029_eeprom_enter(dev);
-	if (ret < 0)
-		return ret;
+	err = rv3029_eeprom_enter(dev);
+	if (err < 0)
+		return err;
 
 	for (i = 0; i < len; i++, reg++) {
 		ret = rv3029_read_regs(dev, reg, &tmp, 1);
@@ -300,11 +300,11 @@ static int rv3029_eeprom_write(struct device *dev, u8 reg,
 			break;
 	}
 
-	ret = rv3029_eeprom_exit(dev);
-	if (ret < 0)
-		return ret;
+	err = rv3029_eeprom_exit(dev);
+	if (err < 0)
+		return err;
 
-	return 0;
+	return ret;
 }
 
 static int rv3029_eeprom_update_bits(struct device *dev,
-- 
2.20.1

