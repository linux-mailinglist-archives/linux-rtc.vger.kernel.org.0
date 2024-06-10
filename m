Return-Path: <linux-rtc+bounces-1270-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E259024F3
	for <lists+linux-rtc@lfdr.de>; Mon, 10 Jun 2024 17:06:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03AE72816D2
	for <lists+linux-rtc@lfdr.de>; Mon, 10 Jun 2024 15:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E18B113D2B2;
	Mon, 10 Jun 2024 15:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="rUGdYzUW"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5ED136E2E
	for <linux-rtc@vger.kernel.org>; Mon, 10 Jun 2024 15:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718031986; cv=none; b=MQPRTjx0xgRihsfd0qxg+8JVGOZbXs2qsakY3lylUEWbaRyWSacDCa550siDg+qGfK8CKi1Ub5zhYZR/pnNqZDhA89CoaiuXsDsv8PRTgvaQI7ki4aUQJHFDo1CVdkYL0/KbyuMoo1AjY0EHYwRmBBovv1nyXC5XLxQ27zwQQFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718031986; c=relaxed/simple;
	bh=e+3kDgVxJ64Kdcvx8luwwAK9CtINfgq4YPhrNoh4AZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:CC:From:
	 In-Reply-To:Content-Type; b=my66sM3cr2zAjKJiiSqcjsmikUFAzfvjh1mmj8SWuUCRSgQ71uorSeC/jLm7uKqirOD466jOlx3wS4LFsMulqY4jnV7EUxAoeN8RsdNSurHh1JrGTkda9tmIpzg7OWKXMeLRGrn6h0qaAY6Q6YUcEYkzWQ4JbiUW60uKBKWUvYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=rUGdYzUW; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 63310A09A1;
	Mon, 10 Jun 2024 17:06:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=Z8MlQqwUWQUh+XOR8gTc
	ho5JkOeJ8FZEeOi0+u8tEYs=; b=rUGdYzUWXupHau8k8SNnVI4o7zuK0Cg6jEv+
	8ybbIw6B1ykOcypYEZeqv787ifK2+WGP1fOMCdZY2JzefSfpaT68hD/Lcv5Ojfai
	ju4hXG66VJ9l+inT+16VyDDR6ZAix+ERgvQZarSc+9QXOd1YdsxUwkveqo2VKT5Z
	9iGwEJueEOFUpFqzg6dH8KgT20Q2mCThhOwlTQep3vx7VfDElaSkcA/P2jOjgwyG
	FcVxQar8hj4HECyQ561qHT9LGeKMBMZAPzl8s38vsySS1JFe33c1JCfK4BVHAmwk
	Lhp+DjKD4NVcYYn2JNLIslveKbWShq1XODIxVXL5d54BfXAH5YBQZOoDcvSm8Wg7
	OuhY+V/TecwShtdG4ljsUt6D8n4aFSrj6bngstjVmFwHxtkqGjB4nfMdB0So/Z/2
	/LeRdALjgM10NvqsYoWq+TCd0rQMdLSIWHz86ixWRMP9Ofx1anrjhfKMffjEcW9b
	yVHrpaYwcWsy1jFA//wSzX5bXyNOHiHLVeLQK/4f1yxxvWFWTiXCPj04ESq9V4RG
	EDv7BvLPR4G0FfmW2YwdyjBLYgVTTdLpr0c91BhQJRHAv0S/tuu9U8Vs3OF8Q3ar
	1xzvNxyx3xr5gm86TrbzjF4t4Cf8e+eTYKVBJCjQ/5Z9MadbWoUkyr4RjKZny+pr
	cAmpDXA=
Message-ID: <2df081c1-8962-47c6-adb8-f3a6d18fa624@prolan.hu>
Date: Mon, 10 Jun 2024 17:06:18 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: rtc: Add driver for SD2405AL.
To: <linux-rtc@vger.kernel.org>
References: <20240607-rtc-sd2405al-v1-1-535971e7a866 () gmail ! com>
Content-Language: en-US
CC: =?UTF-8?B?VMOzdGggSsOhbm9z?= <gomba007@gmail.com>,
	=?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <20240607-rtc-sd2405al-v1-1-535971e7a866 () gmail ! com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2945A12957627D67

Hi János!

On 6/7/24 14:20, Tóth János via B4 Relay wrote:
> From: Tóth János <gomba007@gmail.com>
> 
> Add support for the DFRobot SD2405AL I2C RTC Module.
> 
> Datasheet:
> 	https://image.dfrobot.com/image/data/TOY0021/SD2405AL%20datasheet%20(Angelo%20v0.1).pdf

Is there a reason why this can't be a ds1307 variant? The 12/24 bit is 
in a different place, the day-of-week starts at 0, there's no century 
bit, but other than that, the first 9 registers are the same as in the 
DS1339.

If you really need the separate driver, then you can take a feather out 
of rtc-ds1307's hat and use `dev_set_drvdata()` instead of 
`i2c_set_clientdata()`, `dev_err()` instead of `printk()`, use the 
`BIT()` macro etc.

On top of that, a few miscellaneous remarks:
* The name `SD2405AL_REG_CTR` is confusing. There are 
`SD2405AL_REG_CTR<1-3>` control registers already with a similar name. 
Use `SD2405AL_REG_CNTDWN` or something like that.
* Even though you defined alarm registers, you're not implementing alarm 
capabilities. This should not be hard, given the datasheet and the 
drivers of similar RTCs. Plus, there really is no need to #define all 
alarm registers, the alarm base+offset should suffice.
* Also, you're not doing anything with the control & status registers. 
At the least, in `read_time()` you should check that the RTC is running 
by checking CTR1.RTCF, and if it's 0, return -EINVAL. Similarly, in 
`set_time()` you're not checking if the RTC is writable.

Bence


