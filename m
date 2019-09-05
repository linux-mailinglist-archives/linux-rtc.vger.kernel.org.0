Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D7CBA9CCC
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Sep 2019 10:19:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730710AbfIEITE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 5 Sep 2019 04:19:04 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:46340 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726175AbfIEITE (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 5 Sep 2019 04:19:04 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id B3E1C515E8C09A72F1EA;
        Thu,  5 Sep 2019 16:18:59 +0800 (CST)
Received: from [127.0.0.1] (10.177.29.68) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Thu, 5 Sep 2019
 16:18:54 +0800
Message-ID: <5D70C4EC.4090501@huawei.com>
Date:   Thu, 5 Sep 2019 16:18:52 +0800
From:   zhong jiang <zhongjiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     <tony@atomide.com>, <udeep.dutt@intel.com>,
        <ashutosh.dixit@intel.com>, <gregkh@linuxfoundation.org>,
        <kishon@ti.com>, <jonathanh@nvidia.com>, <a.zummo@towertech.it>,
        <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <arnd@arndb.de>, <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH 4/4] rtc: ds1347: Use PTR_ERR_OR_ZERO rather than its
 implementation
References: <1567665795-5901-1-git-send-email-zhongjiang@huawei.com> <1567665795-5901-5-git-send-email-zhongjiang@huawei.com> <20190905073943.GA21254@piout.net>
In-Reply-To: <20190905073943.GA21254@piout.net>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.29.68]
X-CFilter-Loop: Reflected
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 2019/9/5 15:39, Alexandre Belloni wrote:
> On 05/09/2019 14:43:15+0800, zhong jiang wrote:
>> PTR_ERR_OR_ZERO contains if(IS_ERR(...)) + PTR_ERR. It is better to
>> use it directly. hence just replace it.
>>
> Unless you have a more significant contribution to this driver, I'm not
> going to apply this patch, especially since it will have to be reverted
> as soon as the probe function changes.
Anyway,  Thanks,

Sincerely,
zhong jiang
>> Signed-off-by: zhong jiang <zhongjiang@huawei.com>
>> ---
>>  drivers/rtc/rtc-ds1347.c | 5 +----
>>  1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/drivers/rtc/rtc-ds1347.c b/drivers/rtc/rtc-ds1347.c
>> index d392a7b..5a64eea 100644
>> --- a/drivers/rtc/rtc-ds1347.c
>> +++ b/drivers/rtc/rtc-ds1347.c
>> @@ -151,10 +151,7 @@ static int ds1347_probe(struct spi_device *spi)
>>  	rtc = devm_rtc_device_register(&spi->dev, "ds1347",
>>  				&ds1347_rtc_ops, THIS_MODULE);
>>  
>> -	if (IS_ERR(rtc))
>> -		return PTR_ERR(rtc);
>> -
>> -	return 0;
>> +	return PTR_ERR_OR_ZERO(rtc);
>>  }
>>  
>>  static struct spi_driver ds1347_driver = {
>> -- 
>> 1.7.12.4
>>


