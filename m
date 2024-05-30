Return-Path: <linux-rtc+bounces-1223-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 619018D490B
	for <lists+linux-rtc@lfdr.de>; Thu, 30 May 2024 12:00:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D5A71C21C18
	for <lists+linux-rtc@lfdr.de>; Thu, 30 May 2024 10:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1346B6F2E8;
	Thu, 30 May 2024 10:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="sv0E1FNM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353C715ADBE
	for <linux-rtc@vger.kernel.org>; Thu, 30 May 2024 09:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717063203; cv=none; b=nH4JvgRmMGqqbfTS1kpzF3rQp6jCx9PNftOe+wSHf/6DYxB65mu9U4bFJ/BUtZyg+aALabSdV+2JKkw00gAq/ZHPLW144eRPteVvFTFI9Bz2j8wWPew1ry58WJBY0HaJx8SgnLG/+QWoZkl3/5zh4fwGv4upnZfGVXljEx7BdJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717063203; c=relaxed/simple;
	bh=T+WfVEtrxN8Y6I741XF9v5G1GnHUGOwmZGjQbVMLMiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=f5bqba/QBa2D76aBweh6d0EItWSMwdmrBGzG4oKdyxxDfhn6AOrq6N/9xvJrQaHmvzcGQx0BPhD3t/EfSlc41vXgAmADf8bvtmM6/geqrstKSoP0FG01U5wXac4N5vj/PFZWra1BnmtbjrgZ/7iE4PV0v2sZPbNJBI7to+PEJhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=sv0E1FNM; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 198D9A0748;
	Thu, 30 May 2024 11:59:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:content-transfer-encoding:content-type:content-type:date:from
	:from:in-reply-to:message-id:mime-version:references:reply-to
	:subject:subject:to:to; s=mail; bh=9xqPcVaDIoISYZRzF73btIv+n+8Ax
	GAzvGSGlHIcbLo=; b=sv0E1FNMBji68YJuYJfLkgoyg6sQAkB9vJempvMVHQJ7m
	U4dSxD5vTfr9s4ZYTEeoJUloMZhBtAslv9+tCSUFoAg4Uhu0FqUKbZ2961eC7l1h
	LGydbxP911ZYig0wMVRRDJOzCy0kqk6aYaz9i0RVgZ1gqQ9ZJC+B2/rRj0vkDNHs
	5oHcvkpfaIhqzeIiM0t0269at9vBonqWtfyvgqZ/mzpCZUVM39etWyizzIYDBGyV
	7xPIxPTFx410u5eTJzFpvu/p4JU/n0gRVuEevMyShwilEYHB8gNr/YUTnW6aG0Bn
	bDTsrMTj+hxP0HEQBZrJ/XHaxw877sKmDpPPe4WDcbsvIdYUxl5Jg+GvLIAlb0qk
	W8LwU855oXlQHgWxtoqGJAjWlRtgzRuQkwoTtYuh8qnumxfGkADy64Y2YUq3TW6q
	+bu8pEmK44WbcKdyPs8NIkZLs4uWq6dNMQWUGM0w8mNUtQuZ/9/iDuc8YufSeJki
	D0Q7PqKyfxWV3B1NUPsTq0dpKO9QAn/2UwMb7y1fitDaPg3esY4LZe5LWHFvmJc1
	x3I7zu6v2OlhqGDcS2kLzSHfTMOeQF1t7g8h7Rp+RzMLieIH47cmxIZLe2olhR+8
	dcFCOPMnWMBlMkwTcMLLA4G0p5a+qo1URSINLuO3tlEg85lilPNYRAb4etMt7E=
Message-ID: <81184944-5012-41da-a596-220b74437552@prolan.hu>
Date: Thu, 30 May 2024 11:59:47 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] rtc: Add UIE handling ability to rtc_class_ops
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	<linux-rtc@vger.kernel.org>
References: <20240528161314.404383-2-csokas.bence@prolan.hu>
 <202405281756543dfd3a39@mail.local>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <202405281756543dfd3a39@mail.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2945A12957637365

Hi!

On 5/28/24 19:56, Alexandre Belloni wrote:
> Hello,
> 
> On 28/05/2024 18:13:14+0200, Csókás, Bence wrote:
>> Currently, Update Interrupt Enable is performed by emulating
>> it with either polling, or alarm interrupts. Some RTCs, however,
>> can directly provide Update Interrupts.
>>
> 
> This has been removed from the kernel 13 years ago. What is your use
> case to reintroduce it?

The rationale was in the cover letter. Currently, the RTC core uses the 
alarm system to implement UI, but this causes lost updates on PCF2129. 
However, it has built-in Update Interrupt capabilities in the form of 
the Second Interrupt, therefore we should just use that.

So my question would instead be: what was the rationale of removing it 
in the first place?

Bence


