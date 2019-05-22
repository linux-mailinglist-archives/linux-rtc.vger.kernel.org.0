Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4B6225EDB
	for <lists+linux-rtc@lfdr.de>; Wed, 22 May 2019 09:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728370AbfEVH4l (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 22 May 2019 03:56:41 -0400
Received: from mail2.skidata.com ([91.230.2.91]:60680 "EHLO mail2.skidata.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728159AbfEVH4k (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 22 May 2019 03:56:40 -0400
X-Greylist: delayed 429 seconds by postgrey-1.27 at vger.kernel.org; Wed, 22 May 2019 03:56:39 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1558511822; x=1590047822;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=LJnYEKn5WOXECQB3sJrCxae4KRfYfQTS/G+vasBSN0I=;
  b=dhSvzPENaIXPQ37kr5wOb5EcbT/sO8fSLvlTkzYG+s8gNEMhM6VfEVoi
   fsqe20QodQjryMPX/KVAk5+PgLfl4LQiYYhKwgR/RDnM0mUnQyhCwS3MA
   7PaEL5Uy45uYwRZcLMQUNovVR7lqK6MJL4/+CK5kijP2UsMiSZWyCPmaQ
   f1Z+TSoLrOkqRbJqXBRpYAe/lXOIa8ojVx8q3U44/+fDISRnbxwoKJDSn
   L8L3fAOR4U6LWL3FSM9Wrg0LRiOy2nVXa9ow6/Zt8FiV12jdePdG8gTjf
   26QV/T1gxOsRTCaq4lgoaTtzhn5sQph6f2Q36bu8UxEeH3ZTIcUzU57hi
   g==;
IronPort-SDR: bHCkSqeNf+P5/1K1T9SeqcdO2jZ6RfDMFEkkWOvgFfGljXlAsK+mN7cPZD4UPrEWry9Y4CrCq7
 3tHDsDTiMdjl+Z5GVlvF1QuaQPIxQtrePu4/DFbImMH9kOnaXY1lsM6lQKqGgmP7WjV+zbCvlQ
 oqim7Yp3D5rgQkHq+QwJfGyIX8PzPOs7lW1+LkA/ypuwEKe8WwyccERlirEDygjN73wm1Nacw5
 yN17Dee6VRl5xOFVTagixJm998xZT8Qrp51Thvt6Q2LxB/plIa3THv3LCwDIGZZnfXUMKeVuUZ
 4UE=
X-IronPort-AV: E=Sophos;i="5.60,498,1549926000"; 
   d="scan'208";a="2151447"
Subject: Re: [PATCH 1/3] rtc: s35390a: clarify INT2 pin output modes
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     <a.zummo@towertech.it>, <linux-rtc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20190521142024.25894-1-richard.leitner@skidata.com>
 <20190521142024.25894-2-richard.leitner@skidata.com>
 <20190521155424.GH3274@piout.net>
From:   Richard Leitner <richard.leitner@skidata.com>
Message-ID: <16bd943f-ccae-c3a5-59d3-b429c12c8155@skidata.com>
Date:   Wed, 22 May 2019 09:49:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190521155424.GH3274@piout.net>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
 sdex5srv.skidata.net (192.168.111.83)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 21/05/2019 17:54, Alexandre Belloni wrote:
> Hello,
> 
> This seems good to me but...
> 
> On 21/05/2019 16:20:22+0200, Richard Leitner wrote:

>> --- a/drivers/rtc/rtc-s35390a.c
>> +++ b/drivers/rtc/rtc-s35390a.c
>> @@ -45,12 +45,13 @@
>>   /* flag for STATUS2 */
>>   #define S35390A_FLAG_TEST	0x01
>>   
>> -#define S35390A_INT2_MODE_MASK		0xF0
>> -
>> +/* INT2 pin output mode */
>> +#define S35390A_INT2_MODE_MASK		0x0E
>>   #define S35390A_INT2_MODE_NOINTR	0x00
>> -#define S35390A_INT2_MODE_FREQ		0x10
>> -#define S35390A_INT2_MODE_ALARM		0x40
>> -#define S35390A_INT2_MODE_PMIN_EDG	0x20
>> +#define S35390A_INT2_MODE_ALARM		0x02 /* INT2AE */
>> +#define S35390A_INT2_MODE_PMIN_EDG	0x04 /* INT2ME */
>> +#define S35390A_INT2_MODE_FREQ		0x08 /* INT2FE */
>> +#define S35390A_INT2_MODE_PMIN		0x0C /* INT2ME | INT2FE */
>>   
> 
> While you are at it you may as well use BIT().

Sure, will change that for v2.

regards;Richard.L
