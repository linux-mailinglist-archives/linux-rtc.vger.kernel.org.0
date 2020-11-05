Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E2AE2A89CA
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Nov 2020 23:28:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732370AbgKEW2f (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 5 Nov 2020 17:28:35 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53136 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732434AbgKEW2a (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 5 Nov 2020 17:28:30 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: gtucker)
        with ESMTPSA id 6A5451F46655
Subject: Re: [PATCH] rtc: hym8563: enable wakeup by default
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Heiko Stuebner <heiko@sntech.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
References: <4a52fe66b327fd1974f86b7deb7e2c06d74fe64f.1604613067.git.guillaume.tucker@collabora.com>
 <20201105220938.GG1034841@piout.net>
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <03f589d0-9c6f-4a3b-4d42-8d3f66b13436@collabora.com>
Date:   Thu, 5 Nov 2020 22:28:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201105220938.GG1034841@piout.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 05/11/2020 22:09, Alexandre Belloni wrote:
> On 05/11/2020 22:01:10+0000, Guillaume Tucker wrote:
>> Enable wakeup by default in the hym8563 driver to match the behaviour
>> implemented by the majority of RTC drivers.  As per the description of
>> device_init_wakeup(), it should be enabled for "devices that everyone
>> expects to be wakeup sources".  One would expect this to be the case
>> with a real-time clock.
>>
> 
> Actually, the proper way of doing it for a discrete RTC is to only
> enable wakeup if the irq request is successful or when the wakeup-source
> property is present on the node.

Thanks for the quick reply.  I see, I'll send a v2 accordingly.

Guillaume

>> Fixes: dcaf03849352 ("rtc: add hym8563 rtc-driver")
>> Reported-by: kernelci.org bot <bot@kernelci.org>
>> Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
>> ---
>>  drivers/rtc/rtc-hym8563.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/rtc/rtc-hym8563.c b/drivers/rtc/rtc-hym8563.c
>> index 0fb79c4afb46..6fccfe634d57 100644
>> --- a/drivers/rtc/rtc-hym8563.c
>> +++ b/drivers/rtc/rtc-hym8563.c
>> @@ -527,7 +527,7 @@ static int hym8563_probe(struct i2c_client *client,
>>  	hym8563->client = client;
>>  	i2c_set_clientdata(client, hym8563);
>>  
>> -	device_set_wakeup_capable(&client->dev, true);
>> +	device_init_wakeup(&client->dev, true);
>>  
>>  	ret = hym8563_init_device(client);
>>  	if (ret) {
>> -- 
>> 2.20.1
>>
> 

