Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54FDF1E0460
	for <lists+linux-rtc@lfdr.de>; Mon, 25 May 2020 03:27:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388611AbgEYB1s (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 24 May 2020 21:27:48 -0400
Received: from mail.loongson.cn ([114.242.206.163]:51184 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388574AbgEYB1s (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sun, 24 May 2020 21:27:48 -0400
Received: from [10.130.0.52] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Ax5ukKH8teHrg4AA--.338S3;
        Mon, 25 May 2020 09:27:39 +0800 (CST)
Subject: Re: [PATCH 1/2] rtc: goldfish: Fix return value of
 goldfish_rtc_probe()
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <1590227782-32249-1-git-send-email-yangtiezhu@loongson.cn>
 <20200523195006.GB3429@piout.net>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <58568aec-d964-bae4-b837-106747a034a4@loongson.cn>
Date:   Mon, 25 May 2020 09:27:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20200523195006.GB3429@piout.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Ax5ukKH8teHrg4AA--.338S3
X-Coremail-Antispam: 1UD129KBjvJXoW7CFyUZrW7XFWxJw13Wr15urg_yoW8Gw48pr
        s7CFWUur15KFyUKasrA3WDZF4rurW7KrW0kr9Fq39aqwn8Ary3ArZ7JF40kasY9r18t3WS
        qrs8try3Za909FUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJV
        WxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
        IcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
        v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
        c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
        0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_
        Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUYDGYDU
        UUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 05/24/2020 03:50 AM, Alexandre Belloni wrote:
> Hi,
>
> On 23/05/2020 17:56:21+0800, Tiezhu Yang wrote:
>> When call function devm_platform_ioremap_resource(), we should use IS_ERR()
>> to check the return value and return PTR_ERR() if failed.
>>
>> Fixes: 89576bebbc17 ("rtc: Use devm_platform_ioremap_resource()")
> This doesn't fix an issue and it was anyway not introduced by that
> commit. Please correct your commit message and subject.

OK, thanks for your reply.

I will remove the fixes tag and use the following patch subjects:
"rtc: goldfish: Use correct return value for goldfish_rtc_probe()"
"rtc: mpc5121: Use correct return value for mpc5121_rtc_probe()"

Thanks,
Tiezhu Yang

>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> ---
>>   drivers/rtc/rtc-goldfish.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/rtc/rtc-goldfish.c b/drivers/rtc/rtc-goldfish.c
>> index cb6b0ad..2779715 100644
>> --- a/drivers/rtc/rtc-goldfish.c
>> +++ b/drivers/rtc/rtc-goldfish.c
>> @@ -174,7 +174,7 @@ static int goldfish_rtc_probe(struct platform_device *pdev)
>>   	platform_set_drvdata(pdev, rtcdrv);
>>   	rtcdrv->base = devm_platform_ioremap_resource(pdev, 0);
>>   	if (IS_ERR(rtcdrv->base))
>> -		return -ENODEV;
>> +		return PTR_ERR(rtcdrv->base);
>>   
>>   	rtcdrv->irq = platform_get_irq(pdev, 0);
>>   	if (rtcdrv->irq < 0)
>> -- 
>> 2.1.0
>>

