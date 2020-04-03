Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B39819D281
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Apr 2020 10:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388608AbgDCIpx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 3 Apr 2020 04:45:53 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:33366 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727876AbgDCIpx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 3 Apr 2020 04:45:53 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0338gjE2034729;
        Fri, 3 Apr 2020 08:45:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=giYCfD1uUiP/4g9n6KLPewaZn5f8c4sa0LuOr1LMMng=;
 b=JhBG/X/VEI3EiRBzcxLTWhcCZp5S6KbPv3E2Yz/1S5LAF0OUkqsjM95BKeR1k7GZ2+Ch
 9rj/lW8EGqspdK9dobYvMWVx2gYWvokPIgbLqL5WurbaQIGvoJnBll256rzcXB9j993H
 efEoAHWg5WUKCR/baBAXsokCtue81/Z015v9pcSkte0BhT+vVORi6wWjdd5qIe/3jaOW
 bWztFs7JBLd2xZSstsVGEVgeLwVl2NDt7o4hARa4Sn40lKvZSRQ+Z1Dr/JLT+pRxlw8U
 zvNMxqalDuuMlKRYnhMCFPWZKmAy2eku4knDhxMifigLx/LevB0PJTSHEBK607iW2/04 Qg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 303aqj099p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 03 Apr 2020 08:45:16 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0338h1iC038143;
        Fri, 3 Apr 2020 08:45:16 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 302g2mdb97-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 03 Apr 2020 08:45:15 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0338jCB4012075;
        Fri, 3 Apr 2020 08:45:12 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 03 Apr 2020 01:45:11 -0700
Date:   Fri, 3 Apr 2020 11:45:04 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Colin King <colin.king@canonical.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][V2][next] rtc: ds1307: check for failed memory
 allocation on wdt
Message-ID: <20200403084504.GZ2001@kadam>
References: <20200402135201.548313-1-colin.king@canonical.com>
 <c6fe9db8-3e27-b6fc-fff7-131cecad3f88@roeck-us.net>
 <20200402145312.GN3683@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200402145312.GN3683@piout.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9579 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 mlxscore=0
 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004030074
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9579 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004030074
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Apr 02, 2020 at 04:53:12PM +0200, Alexandre Belloni wrote:
> 
> As stated, I also prefer keeping the watchdog optional and ignore the
> error.

Hopefully you aren't running out of memory on start up.  In current
kernels small memory allocations like this never fail so it doesn't
really affect runtime.  It only silences the NULL dereference static
checker warning.

regards,
dan carpenter

