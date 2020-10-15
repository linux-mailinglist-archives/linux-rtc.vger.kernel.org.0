Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C2E228EFBC
	for <lists+linux-rtc@lfdr.de>; Thu, 15 Oct 2020 11:59:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728543AbgJOJ7K (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 15 Oct 2020 05:59:10 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:39862 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727165AbgJOJ7J (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 15 Oct 2020 05:59:09 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09F9n5dE103285;
        Thu, 15 Oct 2020 09:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=O8viBHD2oi57ibj2towNNb4SdnA3qamN3ei1yapkP1k=;
 b=qLZO+VLANR2w+LZ6hVrdDfmVTIkBAdsvJzpN2IItWM1y4SHjn2dF8W/aJpd7s87vKyo1
 K7ytWg40+7EGg1xdFTvvzFiAEOMLCEepFUYNT5KTg08FnakkfdVDTH95ienkrbRMLfJ0
 phJ1bKlRqnSyhZY7bspoWwQ7K+aVkq4gFV4bSCuGw1xXEqP5t2tMt9OhPdTsoNWVp0Q8
 zQHB2nH/EMgSQhWZvW31K709mfwPCAf1QQi1Z/Gp1pXdDy+QM0Qws85b9NiOlZNQAy0V
 pcTyWg8X7NhLYGsSobzMzTuCvZflDSi2s+manZ4Aro25M9zrenZta6vk6MAcTnPIXA7+ pg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2130.oracle.com with ESMTP id 346g8gh30j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 15 Oct 2020 09:58:59 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09F9ocOS194866;
        Thu, 15 Oct 2020 09:58:58 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 343pw04nxb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 15 Oct 2020 09:58:58 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 09F9wuoT023125;
        Thu, 15 Oct 2020 09:58:57 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 15 Oct 2020 02:58:56 -0700
Date:   Thu, 15 Oct 2020 12:58:51 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     a.zummo@towertech.it
Cc:     linux-rtc@vger.kernel.org
Subject: [bug report] [PATCH] RTC subsystem: class
Message-ID: <20201015095851.GA3042688@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9774 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=3 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010150069
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9774 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 suspectscore=3
 priorityscore=1501 phishscore=0 clxscore=1011 spamscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010150069
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Alessandro Zummo,

The patch 0c86edc0d497: "[PATCH] RTC subsystem: class" from Mar 27,
2006, leads to the following static checker warning:

	drivers/rtc/rtc-r9701.c:109 r9701_set_datetime()
	error: undefined (user controlled) shift '1 << dt->tm_wday'

drivers/rtc/rtc-r9701.c
    95  static int r9701_set_datetime(struct device *dev, struct rtc_time *dt)
    96  {
    97          int ret, year;
    98  
    99          year = dt->tm_year + 1900;
   100          if (year >= 2100 || year < 2000)
   101                  return -EINVAL;
   102  
   103          ret = write_reg(dev, RHRCNT, bin2bcd(dt->tm_hour));
   104          ret = ret ? ret : write_reg(dev, RMINCNT, bin2bcd(dt->tm_min));
   105          ret = ret ? ret : write_reg(dev, RSECCNT, bin2bcd(dt->tm_sec));
   106          ret = ret ? ret : write_reg(dev, RDAYCNT, bin2bcd(dt->tm_mday));
   107          ret = ret ? ret : write_reg(dev, RMONCNT, bin2bcd(dt->tm_mon + 1));
   108          ret = ret ? ret : write_reg(dev, RYRCNT, bin2bcd(dt->tm_year - 100));
   109          ret = ret ? ret : write_reg(dev, RWKCNT, 1 << dt->tm_wday);

I would have expected that rtc_valid_tm() would check that dt->tm_wday
as valid but it doesn't.  As far as I can see dt->tm_wday can be set to
any int value in the rtc_dev_ioctl(). 

   110  
   111          return ret;
   112  }

regards,
dan carpenter
