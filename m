Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89D04114D7C
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Dec 2019 09:19:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726271AbfLFITg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 6 Dec 2019 03:19:36 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:16768 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726088AbfLFITg (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 6 Dec 2019 03:19:36 -0500
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xB68HKZ8029511;
        Fri, 6 Dec 2019 09:19:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=6vcNVWFrHn/SvqVY9StBuo/jTuPFzfRjFOoFMP+jKUU=;
 b=NwOAavXGFLkqdSgokTDPjp9XTHmJVfeSnH2AB/3N+M4tdXmreX35BQJjvk+22xXiibJN
 T0KSl8UtuyEb7K10bXWiDDI16i/F5ZOADisRT4UXywZtU5N3KpzlqIy3NJVEy5WbcCOH
 hxbrczOeUeNigf4ctd/E+5lOnLSzUPT+bQMiGjKwJ9y3KhZur9WZKqeYZHlAbiiZpgg3
 3LRKOKb9Zc7WyKfzZAeFjoEJ8eKK5IhU7E9dAsr1d88iydrVL7lJNOpvt4r8r/gXEyga
 vKDZJRVqKWuXU3zmh53DqFbtQXG8tpGG8dcTTeg7qYhSw8xJoZRGQ1gTxPsQkY20v9o3 8w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2wkf2y7a2x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 06 Dec 2019 09:19:16 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3AFDB100034;
        Fri,  6 Dec 2019 09:19:16 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1F14C2A68A1;
        Fri,  6 Dec 2019 09:19:16 +0100 (CET)
Received: from lmecxl0995.lme.st.com (10.75.127.50) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 6 Dec
 2019 09:19:15 +0100
Subject: Re: [PATCH] rtc: stm32: add missed clk_disable_unprepare in error
 path of resume
To:     Chuhong Yuan <hslester96@gmail.com>
CC:     <linux-rtc@vger.kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        <linux-kernel@vger.kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20191205160655.32188-1-hslester96@gmail.com>
From:   Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <521207d1-4537-fda9-ca03-4f952b505d03@st.com>
Date:   Fri, 6 Dec 2019 09:19:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191205160655.32188-1-hslester96@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-06_01:2019-12-04,2019-12-06 signatures=0
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 12/5/19 5:06 PM, Chuhong Yuan wrote:
> The resume() forgets to call clk_disable_unprepare() when failed.
> Add the missed call to fix it.
> 
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---
>   drivers/rtc/rtc-stm32.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
> index 781cabb2afca..d774aa18f57a 100644
> --- a/drivers/rtc/rtc-stm32.c
> +++ b/drivers/rtc/rtc-stm32.c
> @@ -897,8 +897,11 @@ static int stm32_rtc_resume(struct device *dev)
>   	}
>   
>   	ret = stm32_rtc_wait_sync(rtc);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		if (rtc->data->has_pclk)
> +			clk_disable_unprepare(rtc->pclk);
>   		return ret;
> +	}
>   
>   	if (device_may_wakeup(dev))
>   		return disable_irq_wake(rtc->irq_alarm);
> 

Reviewed-by: Amelie Delaunay <amelie.delaunay@st.com>
