Return-Path: <linux-rtc+bounces-1421-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 595A991BA89
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Jun 2024 10:58:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8969E1C217BC
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Jun 2024 08:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD8D814E2C9;
	Fri, 28 Jun 2024 08:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="Q8CFy1US"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1E714AD35;
	Fri, 28 Jun 2024 08:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719565118; cv=none; b=qvXzPi1ix4Awg9ir72FB845A/pGPEuRkVRpoeALPpsebI1PDdNllBKvfvuA6aLy0qZtLqP4k93+xif2n/+FEk2MeNPvLv2Fc7QjJukHdQxMwFr/cNsfN1S0/NQBDxkh7UJPS9hsK//OVOf+TNiWeU8JFbya89POcIT7sDgsMfoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719565118; c=relaxed/simple;
	bh=PWL6hEvqmZKsuBznvNlNI6WklKd2ODvQV6+yRxLHbIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=O3VjKRrX9VkmhHmwRa/eg723OTZg0Bi+pobzxoj2piNHd2u5sLDM+QBrkfpqxDOgFEVCbGSP3+9TgGLdiSsujCZBW20HpJTH+6rCUJugs69vJrMt4Ftx+hpKMNi9rYCqOW2Nv8jSyeGJFHOheleeUGpGLvCa50e2hit6HRwbpIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=Q8CFy1US; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 308FEA0608;
	Fri, 28 Jun 2024 10:58:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=DgXaLxXe1xWsWcx5Us3s
	/TGr8c82QL8Uqd0FFIZe7oY=; b=Q8CFy1USBcGokTohSzsQs3WnV//gszXH6ymY
	E9FQe610W6zZa1CAjPyXNFz3cs5lEn4tOiLo5xBpcVVd9XPrmnl+muzhzH6vxY9z
	dmtQjfAT+T7ywDIJwz0zFF9dj2wRMHePMPn2aQT266nSr9xO8wTddU4UOdAOCP68
	epxJEmWcpmD7lNSYBPryG6PPnFJ/5HqcaAMr+nzOUHF5iBgLAkuEdyKdxLGcY69N
	Kczmjevk+IHxregefwyKo/ekUCsK1WFo2PLTr7ZAZYsQ8qbOx6DKSbmdOm4kCskG
	wuH8vlMMv3UKf5E/mF7Xmy49eSzTD+0/oUyuvLxMHkdKWHv2PYfSNj7UM8XYTtLG
	zZ6DqXdnepr4CQghdnM+/LPy5ZqscmWpuSbXWfOQqJxsJPxY3DsprsuPWlL18Hp6
	1kdGDqIOjf1e3P0RgXdl/EVtBzMyDAzCJY1d4Wt2zQk9SiZLAP91zS5X1UP1I8id
	SbeJPNfFqDUSAdmd7Xonh1Z0rDLKgyzTpeUFCELXZTU9NdlgU9hF7o1SQtHvYfqe
	x17JUDxp7rnMaPDb+i/NI+RjDRNTcmVV4t+8TBdUUNroDkFEFCo8wrrHmcZ56Lh6
	qqb7JKWcCM8SRobBaHhEmEklneXT3dwOVDDbg3lO4SliirsvItQEiq/W7LxgIVB5
	jVIw82g=
Message-ID: <83e2d171-86b0-4d51-8481-dc5b482b97a3@prolan.hu>
Date: Fri, 28 Jun 2024 10:58:33 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH resubmit] rtc: ds1307: Detect oscillator fail on mcp794xx
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	=?UTF-8?Q?Szentendrei=2C_Tam=C3=A1s?= <szentendrei.tamas@prolan.hu>
References: <20240621080512.2916664-1-csokas.bence@prolan.hu>
 <202406272237033260538e@mail.local>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <202406272237033260538e@mail.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2945A129576C7D63

Hi!

On 6/28/24 00:37, Alexandre Belloni wrote:
> Hello,
> 
> It is not clear to me why your resent this one but not the other one,
> can you elaborate?

It was kind of an unrelated patch, I'll send it after I get this one 
merged. But so far, there hasn't been any movements on this series at all.

> On 21/06/2024 10:05:13+0200, Csókás, Bence wrote:
>> This patch enables the detection of the oscillator failure
>> on mcp794xx chips.
>>
>> Co-developed-by: Szentendrei, Tamás <szentendrei.tamas@prolan.hu>
>> Signed-off-by: Szentendrei, Tamás <szentendrei.tamas@prolan.hu>
>> Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>

The "other one", I assume, refers to this:

On 6/11/24 09:24, Csókás, Bence wrote:
 > `tm_year` may go up to 299 if the device supports the
 > century bit. Therefore, subtracting may not give us
 > a valid 2-digit number, but modulo does.
 >
 > Co-developed-by: Szentendrei, Tamás <szentendrei.tamas@prolan.hu>
 > Signed-off-by: Szentendrei, Tamás <szentendrei.tamas@prolan.hu>
 > Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>

And the only thing they had in common is that they were in the same 
file, which my colleague, Tamás, put into one commit in our tree, that I 
split for upstreaming purposes. But really, they are not really related 
or interdependent on one another.

Bence


