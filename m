Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB3121122FA
	for <lists+linux-rtc@lfdr.de>; Wed,  4 Dec 2019 07:37:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726899AbfLDGhV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 4 Dec 2019 01:37:21 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:49060 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725791AbfLDGhV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 4 Dec 2019 01:37:21 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xB46YkGL057001;
        Wed, 4 Dec 2019 06:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=yG0uO4UflwgTcea/waIQnEHCSa54PpQUZzE3UTh8gjU=;
 b=awAy7H72frQh/Ubir0MQ7Yg/Djd/bP6Cb2Q6IDZ0aC0a223v4OrGitrQBXKjxQBCxT66
 7Yik4vWDyAmhq6OTdUz8Oh9ZwH03WuoiQc/GGsZeibbCs8xFFH8DC22+e33YYXUj/O8L
 7bY/X1QQC4Hrxyva6Y+plLT5dWA/7CHto0Ju3rpsq9s1dsLfOpIuQe02JY98f0HBrm0G
 qXYt7/sR2zK6IPzmLy+7Hiyb0u+ArW7UPoTLz76SijKWdvD1fS8PrZZOkYDtt8WavggA
 5zR/84qjlzzUFs0B+bgV2hJzbjRIGWBatb3etxzSH0T1IuATsJsGdiNdDFbwatUFT4s5 ww== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 2wkh2rc7m6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 04 Dec 2019 06:36:46 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xB46TClM062802;
        Wed, 4 Dec 2019 06:36:46 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 2wp17csvwu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 04 Dec 2019 06:36:46 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xB46ahDX004121;
        Wed, 4 Dec 2019 06:36:44 GMT
Received: from kadam (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 04 Dec 2019 06:36:42 +0000
Date:   Wed, 4 Dec 2019 09:35:28 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Mao Wenan <maowenan@huawei.com>
Cc:     eddie.huang@mediatek.com, sean.wang@mediatek.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] rtc: mt6397: drop free_irq of devm_xx allocated irq
Message-ID: <20191204063444.GF1765@kadam>
References: <20191204020209.10363-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191204020209.10363-1-maowenan@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9460 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912040046
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9460 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1912040047
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, Dec 04, 2019 at 10:02:09AM +0800, Mao Wenan wrote:
> rtc->irq is requested by devm_request_threaded_irq,
> and request_threaded_irq. IRQs requested with this
> function will be automatically freed on driver detach.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>  drivers/rtc/rtc-mt6397.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
> index 5249fc99fd5f..d6a10111137a 100644
> --- a/drivers/rtc/rtc-mt6397.c
> +++ b/drivers/rtc/rtc-mt6397.c
> @@ -293,7 +293,6 @@ static int mtk_rtc_probe(struct platform_device *pdev)
>  	return 0;
>  
>  out_free_irq:
> -	free_irq(rtc->irq, rtc);
>  	return ret;

Please get rid of the error label as well.

regards,
dan carpenter

