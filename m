Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26AFD19D271
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Apr 2020 10:41:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390426AbgDCIlL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 3 Apr 2020 04:41:11 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:37528 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389015AbgDCIlL (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 3 Apr 2020 04:41:11 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0338ddlC171976;
        Fri, 3 Apr 2020 08:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=zI0SLLXDZwbYmFdbXl+AztfRWd//R25ljLaNr0Nk3+U=;
 b=F/rqNLZSBmDwmHrYbczhj3Pnvpau7ON5KSEPH1C3P/TuKsJbx7uoCerji4d7PU/7JXH9
 ZtYS+pCio2g6g0NAdS579RBKrInsa8kzpx41yqWa73UO0Gbj/6eWSpzxAKJlEk9ed60p
 tR6xLGsl4xy5twPWa9WeDe29K7oPTTXUlI3/XMNaxOydPtZqH/VOk/Vf1eK94IBtJA91
 WGgOQlsZxwmqtiipSq1MEkJrN494SaWTNa9o00GF/EIqodHpeRPw7WqOH0Rq8dPhrGBm
 sN7rMOhLxRKqtt8JDfH3pneGmhO3NKIF71DVVeNyw6vwPweQ2aUIOZCiYBkQToFfi6Hq TQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 303yunjbh9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 03 Apr 2020 08:40:30 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0338b9rg184363;
        Fri, 3 Apr 2020 08:40:29 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 302g2md36s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 03 Apr 2020 08:40:29 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0338eLEf008678;
        Fri, 3 Apr 2020 08:40:21 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 03 Apr 2020 01:40:20 -0700
Date:   Fri, 3 Apr 2020 11:40:13 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] rtc: ds1307: check for failed memory allocation on
 wdt
Message-ID: <20200403084013.GY2001@kadam>
References: <20200402131441.539088-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200402131441.539088-1-colin.king@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9579 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 mlxscore=0
 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004030073
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9579 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0
 suspectscore=0 mlxscore=0 spamscore=0 impostorscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004030073
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Apr 02, 2020 at 02:14:41PM +0100, Colin King wrote:
> @@ -1979,9 +1984,9 @@ static int ds1307_probe(struct i2c_client *client,
>  
>  	ds1307_hwmon_register(ds1307);
>  	ds1307_clks_register(ds1307);
> -	ds1307_wdt_register(ds1307);
> +	err = ds1307_wdt_register(ds1307);
>  
> -	return 0;
> +	return err;
>  
>  exit:
>  	return err;

This bit is weird.  I guess just delete the "return 0;" without
introducing a new "return err;".

regards,
dan carpenter

