Return-Path: <linux-rtc+bounces-1872-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 274DB96BFF9
	for <lists+linux-rtc@lfdr.de>; Wed,  4 Sep 2024 16:20:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A0621C24D73
	for <lists+linux-rtc@lfdr.de>; Wed,  4 Sep 2024 14:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 230C31E00A6;
	Wed,  4 Sep 2024 14:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="LyC6MZ9H"
X-Original-To: linux-rtc@vger.kernel.org
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D085D1E00A4
	for <linux-rtc@vger.kernel.org>; Wed,  4 Sep 2024 14:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725459456; cv=none; b=UqUejyPKxUy5mRUeOqNwT6fTHninx2rZhq4rVw9cFQnnV5XTEqImv07u3/q8JAd6UN2z+fLspsshsabVxF0f9Q9b36KelbV2sFHkAM0YmU8DNAZAiCOVzHkzL+yUZ9wUWAqx/hmZmp7XYM9yxSawUoq6F609MPml9LeAOUpTtxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725459456; c=relaxed/simple;
	bh=WIm84H2mmnsIK6IhMzZ+R1nRWNpIDii8yeJ1IOe+8s8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I/wKAnBysay1gr5jEz39/olIqNo+RYc/cRKSJmKPo+0EBN8aYy/DZt5fYebeni2pH1+TeIy/EQ0hbupgDfnb0CSL7LicNhD6VnuPvhZcq4bkih9t9m0xGm8VBY3++2Z1xJMKSwCgOaWjz7/PhH12yFIPGxG8fBM7lOyb9Dsdhiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=LyC6MZ9H; arc=none smtp.client-ip=44.202.169.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Received: from eig-obgw-5008a.ext.cloudfilter.net ([10.0.29.246])
	by cmsmtp with ESMTPS
	id lmF7s7jrNnNFGlqp3sf7yF; Wed, 04 Sep 2024 14:17:25 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id lqp0sVhcQlBoelqp1sxZtL; Wed, 04 Sep 2024 14:17:24 +0000
X-Authority-Analysis: v=2.4 cv=Lc066Cfi c=1 sm=1 tr=0 ts=66d86bf4
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8
 a=HSDmG33uGC2uzMr5-wEA:9 a=QEXdDO2ut3YA:10 a=rsP06fVo5MYu2ilr0aT5:22
 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=u3Lk9sQSz+EbH5buYhkOPLBvuDmn7/9B/u1wslum9Xo=; b=LyC6MZ9HIBeeUjoxWaMQaJ/s2A
	Rs33Marh1EyfTCuYxcNDjhXsCov2NlkItKJLbyAGDWD+XlCQGSWoOT70hhEPfENiBTWReCt1VwEsv
	idot4CKai9OaD9wzYZdzwcpFTqXsQAQNAONYIwgKJ7hl7MTHpPvYbzti9siDc9oFNvQ4INZIL5DJb
	9XLULsPYfcbhITbSYMUkuNOas+kiGbUuiaQiJ8vk4uTaUH8ZrOZD8dl9U81f++goSdUwQrdkJ7J1m
	euOR+BFjjWBwM9K2zit4d8KFK912LZJEBIVi3q7phz7lsTsEEwT2nQS9G9JL5hsh6nc0Km1nSkPCh
	fv37CPoQ==;
Received: from [122.165.245.213] (port=55132 helo=[192.168.1.106])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <karthikeyan@linumiz.com>)
	id 1slqoy-003hhL-2T;
	Wed, 04 Sep 2024 19:47:20 +0530
Message-ID: <e86edfae-cdc8-475a-97fc-dab69a023761@linumiz.com>
Date: Wed, 4 Sep 2024 19:47:18 +0530
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] dt-bindings: rtc: microcrystal,rv3028: add
 clock-cells property
To: Rob Herring <robh@kernel.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20240903105245.715899-1-karthikeyan@linumiz.com>
 <20240903105245.715899-6-karthikeyan@linumiz.com>
 <20240903144542.GA985263-robh@kernel.org>
Content-Language: en-US
From: karthikeyan <karthikeyan@linumiz.com>
In-Reply-To: <20240903144542.GA985263-robh@kernel.org>
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
X-Exim-ID: 1slqoy-003hhL-2T
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.106]) [122.165.245.213]:55132
X-Source-Auth: karthikeyan@linumiz.com
X-Email-Count: 1
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfGg2RAsalPZceoRDWZ3IcoJTPaX+TOiQelDhsFSZcqCv6uwTeGtXnrqdF1cWo/XcSP+dbJj5K4PYiOpNDISv0X2j2yzZk05ld2S3qU9k9gYxb6JpbVFQ
 XQd+inHd3P8f8Puy6a4XjvuESBuTJ90EXDGotN+bZloTIS1LBsEPhSiWkbUZ6VBGhMFHDvgNMnm589d9TBg5hP9VoGXqP31A1ZA=

On 9/3/24 20:15, Rob Herring wrote:
> On Tue, Sep 03, 2024 at 04:22:42PM +0530, Karthikeyan Krishnasamy wrote:
>> consume clkout from rv3028 rtc which is able to provide
>> different clock frequency upon configuration
> 
> Please write complete sentences.
> 
> The subject is wrong. There is no such property 'clock-cells'.
I will updated in next version. Thanks.
> 
>>
>> Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
>> ---
>>
>> Notes:
>>      v2:
>>      - fix commit message subject
>>
>>   Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml b/Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml
>> index 5ade5dfad048..cda8ad7c1203 100644
>> --- a/Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml
>> +++ b/Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml
>> @@ -22,6 +22,9 @@ properties:
>>     interrupts:
>>       maxItems: 1
>>   
>> +  "#clock-cells":
>> +    const: 0
>> +
>>     trickle-resistor-ohms:
>>       enum:
>>         - 3000
>> -- 
>> 2.39.2
>>

Best regards,
Karthikeyan

