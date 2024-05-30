Return-Path: <linux-rtc+bounces-1226-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1188D4D19
	for <lists+linux-rtc@lfdr.de>; Thu, 30 May 2024 15:50:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 969B8289742
	for <lists+linux-rtc@lfdr.de>; Thu, 30 May 2024 13:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D89A186E38;
	Thu, 30 May 2024 13:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="g2sQEk/E"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECF8186E39
	for <linux-rtc@vger.kernel.org>; Thu, 30 May 2024 13:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717076834; cv=none; b=mvVobZeYu3xrQz216Fbvv7ZI/Thjn0SNJ6jEq6Peuz9C3FoWTDB+oc9Z11sznyWultvT0vg138+Qze17eS3lj0lwbJrORcGlHQ2Yo79U9QPazwjaN92hCXDvI3wPMw3cFvbSVv6XLkdT+w1+Jj6fTdHXViq1cxl2PqRddD+qBgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717076834; c=relaxed/simple;
	bh=9ye2wqPTLgZ3v8FFSRNCMxgsja3q/h8ax/CD6OS+8jU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PAXDIUVB+5OeBVf8AVH984zYmzWxZVngcr4yh60je1GTecIjcJU3TknLxCPirmSM8RbbuGE+Z/nAIzQSGK4ciKmYbhWWcVuce+QmQTOhKPTrgekN6DnpgOJ47dn69m0hRO6y8Qp2IWycr4WF/h2EqqX2QdR2wl+rHKxiDii/Um4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=g2sQEk/E; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id E40D5A06AD;
	Thu, 30 May 2024 15:47:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=+6gtvOOMtg++bUJUZyBG
	2yMUKtl8hONpobWZYHkU90M=; b=g2sQEk/Ei56YiEp0QOkD2zxaRKYNWylt5saW
	TE4NVOnB2IQtGhbMvJuoaFSZQAZNy611Fc5Pg2MbE/uRVFRW5qGm+OMGFrHRIFSI
	d/ZiWUhT9hEI1gxbxIg0G4V7glc2t0Yhc9Ifd//n6Oc3Dle4BuX4U4iuLnN8ARLB
	OZgtoYWOhdNcqK8yTLKf7k9tsQYDeAGJQp8ISrFqSPiRY9B+2u1MPTwTGY1kVSQe
	1kosD56i+f6iGTxo+im7oQQt3bX9QX5XD9+QedAhuZi4yWmL97JI3q5NW6UCXhDU
	zUXxykBLp/wKTe4i1AeOxLUAhJEZfbDW715/klNTVmQBHttBIOTr27oAazByls0R
	/nq8D2exMmOpQpGMccVte9s/wmruTRGOjePzvl2cGx+qMEg2IEk1HjLFmhFsUCKU
	eBtGQkeylJcGpHIBwguorLtc+DFC9vOBc6iNlGWIhW4KnYD2T6PrlzFC+Oe6aqBK
	/u0lk1eJ2A7bMNqnVVDyq5EO32NyK1HsYwdq8bCGC0FCq6EBYU0zVFI7eeLQ5d+u
	+s/m7nQ3NghZuPXsi1BsGjT8AVojZo8yh+9U29W57Yw/PSbdZm8DmqYHbE19u3bD
	DqlWXId9fWYk8daVc9XjaFJ2L6C+SWzRey9fDXaMR4hDlmEX341C0Pa923IwkxxL
	55+VSb8=
Message-ID: <4947fa9b-a8bf-40b8-83ce-d365cf917a95@prolan.hu>
Date: Thu, 30 May 2024 15:47:01 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] rtc: Add UIE handling ability to rtc_class_ops
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: <linux-rtc@vger.kernel.org>
References: <20240528161314.404383-2-csokas.bence@prolan.hu>
 <202405281756543dfd3a39@mail.local>
 <81184944-5012-41da-a596-220b74437552@prolan.hu>
 <20240530103532e6d4f421@mail.local>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <20240530103532e6d4f421@mail.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2945A1295763736B

Hi!

On 5/30/24 12:35, Alexandre Belloni wrote:
> Well, you didn't answer my question which is why do you need UIE and
> especially UIE from the RTC? Using the timer emulation is probably what
> you want because it is in sync with your system time.

We set up `chrony` to use UI events as a time reference. Upon startup, 
`chrony` opens the RTC with UIE_ON, reads the initial RTC value on the 
first transition, then keeps the system clock in sync with the RTC using 
the interrupt signal. So we want to synchronize the system time to UIE, 
not the other way around.

 >> So my question would instead be: what was the rationale of removing 
it in
 >> the first place?

I was genuinely asking, because I couldn't find the original letter, 
only subsequent ones from 2-4 years ago, removing bits and pieces from 
individual RTC device drivers.

Bence


