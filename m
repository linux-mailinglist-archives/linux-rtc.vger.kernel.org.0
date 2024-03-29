Return-Path: <linux-rtc+bounces-925-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC2689212A
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Mar 2024 17:04:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 972BA1C22DF0
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Mar 2024 16:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FED654676;
	Fri, 29 Mar 2024 16:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="JjdG2ubE"
X-Original-To: linux-rtc@vger.kernel.org
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385CF17E
	for <linux-rtc@vger.kernel.org>; Fri, 29 Mar 2024 16:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711728246; cv=none; b=JbM0FL+O2xW/BPi+x5yJarSjVSdyACKH2HO2yhfpMdtBPRfCUufJG6LJE2ahhQ/Ll1/1JfcNS6zCGpsWWWI01rkl6vFaR8YWPqxexCJcCMJ189Vds7It4ADspQ1vgjKCqR7UYB/8gMuiwUOUdSk/9Ytcah0/NboPF1dXtF2fFa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711728246; c=relaxed/simple;
	bh=732K/XnBNH6TMeCPYvn8g4FYNQ0rWfv8ASum/ByW3l0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X1sdOGYrkd2HaTnIbmtJqBCYjO+Qt8Xn5cn/G/6xQKJyFuBHEF6zw7JafO7vUBFy5ZIaAgCMTqJiSXV6LhXjpSgVC9rI27tm6yb/2v53oCew7uDd1M5RS8aD0oEVVdBDzDB1GdvpYEp7AQWXfg7VDgLsYvRsgPycyJvEHML95FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=JjdG2ubE; arc=none smtp.client-ip=44.202.169.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Received: from eig-obgw-6010a.ext.cloudfilter.net ([10.0.30.248])
	by cmsmtp with ESMTPS
	id pgkvrLAVjl9dRqEhyr3UlP; Fri, 29 Mar 2024 16:03:58 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id qEhvrR4AUQufZqEhwrQ5Xd; Fri, 29 Mar 2024 16:03:57 +0000
X-Authority-Analysis: v=2.4 cv=eK4Vjmp1 c=1 sm=1 tr=0 ts=6606e66d
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=K6JAEmCyrfEA:10 a=oz0wMknONp8A:10 a=vU9dKmh3AAAA:8
 a=BvONN35OqgEy8-QZpXoA:9 a=QEXdDO2ut3YA:10 a=rsP06fVo5MYu2ilr0aT5:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aHU8LaL+HMkC/1OFnSc7IMvxGqZxLbVRl1K9ttHFCuk=; b=JjdG2ubE8kQ0vnURdpRSxuFi9j
	hew5YEwCvcFJQCeC1F0aVmXfPPtSWmpqayZ8wRSXMK4LrroQxU+LKk+YDDEDVJFxbE9AdPAig0mmP
	JCl88WOOagVOfQC6lTcsILDnY0F5ObS/FxRa8Mn4rsTWI8d0LIRISmBNOnC03Favnjd+h6G9pbQmV
	x4w0WPtv4JGyDaJ66k7xmoDjlptWQOKSnvG82dRwXJVk/pAGxNoCVEgxq9bq5nIbw3OgvMuemrJec
	+BHyUIgie74lobCIO4mbIPhtfK1P4HPGRJqcbbbT//VfDwGVF7/sA4s/c6DD6ZgKKKIfURcUuPOq8
	yFRhWkEA==;
Received: from [122.165.245.213] (port=60658 helo=[192.168.1.32])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <karthikeyan@linumiz.com>)
	id 1rqEhu-001jxe-04;
	Fri, 29 Mar 2024 21:33:54 +0530
Message-ID: <1823735f-d677-4f5a-ae39-713f0c9b7777@linumiz.com>
Date: Fri, 29 Mar 2024 21:33:50 +0530
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: rtc: rv3028: check and update PORF flag during
 probe
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
 parthiban@linumiz.com, saravanan@linumiz.com
References: <20240329101940.1424643-1-karthikeyan@linumiz.com>
 <20240329102847fcdca1cf@mail.local>
From: karthikeyan <karthikeyan@linumiz.com>
In-Reply-To: <20240329102847fcdca1cf@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1rqEhu-001jxe-04
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.32]) [122.165.245.213]:60658
X-Source-Auth: karthikeyan@linumiz.com
X-Email-Count: 2
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfBNQBpSwjROis7KDcbOY5cuUaJ1LGS0LuOH1awuTFKfqGwF6EXPvHktK9PlJMzjodVZ8fNkgcvCyAf58t0XJz5Qum0dKtghsQ+P122iLB7GzSCWs9+qG
 I5Uxbh4iCHeTBoIKKCAp/HYBHQgZnTLU5vGAj2Y83j9Q1KJvY0R9nVATByyvEfodNF4ICk4gigUP0sygPmU/SqUQDOtXGftKP6Q=

Agreed. Thanks for clarification.

Regards,
Karthikeyan Krishnasamy


On 3/29/24 15:58, Alexandre Belloni wrote:
> On 29/03/2024 15:49:40+0530, Karthikeyan Krishnasamy wrote:
>> PORF flag is set during power reset and voltage drop below Vpor
>> data in rtc device is no longer valid if PORF flag is set
>> and software must reset to 0, in order to perform sanity
>> check on rtc data
>>
>> Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
>> ---
>>   drivers/rtc/rtc-rv3028.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/rtc/rtc-rv3028.c b/drivers/rtc/rtc-rv3028.c
>> index 2f001c59c61d..e9699ff0c4e8 100644
>> --- a/drivers/rtc/rtc-rv3028.c
>> +++ b/drivers/rtc/rtc-rv3028.c
>> @@ -951,6 +951,13 @@ static int rv3028_probe(struct i2c_client *client)
>>   	if (ret < 0)
>>   		return ret;
>>   
>> +	if (status & RV3028_STATUS_PORF) {
>> +		ret = regmap_update_bits(rv3028->regmap, RV3028_STATUS,
>> +					 RV3028_STATUS_PORF, 0);
>> +		if (ret < 0)
>> +			return ret;
>> +	}
>> +
> 
> This breaks the workflow, you must set the time to reset PORF.
> 
>>   	if (status & RV3028_STATUS_AF)
>>   		dev_warn(&client->dev, "An alarm may have been missed.\n");
>>   
>> -- 
>> 2.34.1
>>
> 

