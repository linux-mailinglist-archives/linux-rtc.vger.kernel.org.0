Return-Path: <linux-rtc+bounces-6294-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id y1KNHc7l0GlcBwcAu9opvQ
	(envelope-from <linux-rtc+bounces-6294-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 04 Apr 2026 12:19:58 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBE439ABC1
	for <lists+linux-rtc@lfdr.de>; Sat, 04 Apr 2026 12:19:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E048A3006145
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Apr 2026 10:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 012A535295E;
	Sat,  4 Apr 2026 10:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PwwXKYeK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA3C361640
	for <linux-rtc@vger.kernel.org>; Sat,  4 Apr 2026 10:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775297993; cv=none; b=qfOGWoZ8802ik5lAuMFOj41VSuNZWJBi3TKKYNebmlzyDUh9MoJtlFy/mGWIX9KU0qkrkQYIjpebyv4nD3oDznpky/6aisfQQprmlBmyvQ3X6+ad2zeoVveufot1cTPGJq1mxFu9mjBiiXT8QS32AYP3P/RTFNzqxKwYW+LBE2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775297993; c=relaxed/simple;
	bh=xOjx4EdmTW8vJR2HalmJO8eN/dHDURsVNLSCnW9E4V4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NqehOSpk30el72JT61dLv/S8u49XChVqYSEODV/e3Y3qYc0ZYJlIXoX/HkKK/7FKqMH2kkU/btISln4Qs3dg5zPIvJhE3nxyhK5UqFwct7k3rvJ7dWGbu9YfmGK6vAqrKwSRMPvIglujXAe6lg3d1OOmCwkB29wK8BwzKhfu0OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PwwXKYeK; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A41741A3144
	for <linux-rtc@vger.kernel.org>; Sat,  4 Apr 2026 10:19:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7A974603C2;
	Sat,  4 Apr 2026 10:19:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A3D0F104501B8;
	Sat,  4 Apr 2026 12:19:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775297988; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=JLi159JA4rI9yQ6eIfoWJTA5diFhS/Hhy+gCgC9mrdU=;
	b=PwwXKYeK0iO1x7+61xgdp2k3YQMG/4EAAewd+apma3WMnRU7Ut6b98swDyJn3McdSMcI9m
	DSyg5IkWl8UOj5NSbv8dYG7bWpk7Wzvwdse6Q2zPuL618d2ROuPY0B+Gy38qr9eDHIpsSV
	HNdKDAjegPHMAClcdqTjzKNPbuKLCC4/a+HF6xGUDo8gXQj5a+Rcom81XPEd9GjavU9faE
	/rgCfw09T3unOvwb7qBiGcymDaQWWzwWrXwfp3RoASfJytbxcb2CydhWdAoYJ8q1vzN5z/
	p6guef2i5sV/3WQDknTdGsq7Z8kI+prM2hOJA+0iynFkPoF7BBGbaDrAeUIdrw==
Date: Sat, 4 Apr 2026 12:19:45 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: cmos: Remove redundant include of linux/acpi.h
Message-ID: <20260404101945603a5e04@mail.local>
References: <20260304023533.503066-1-nichen@iscas.ac.cn>
 <177523251878.1559844.5790356423146303538.b4-ty@b4>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177523251878.1559844.5790356423146303538.b4-ty@b4>
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6294-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EEBE439ABC1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 03/04/2026 18:08:50+0200, Alexandre Belloni wrote:
> On Wed, 04 Mar 2026 10:35:33 +0800, Chen Ni wrote:
> > The header file <linux/acpi.h> is already included globally at the top
> > of the file. The second inclusion inside the #ifdef CONFIG_ACPI block is
> > redundant because the header uses include guards to prevent multiple
> > inclusions.
> > 
> > Remove the duplicate line to clean up the code and slightly reduce
> > preprocessing overhead.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/1] rtc: cmos: Remove redundant include of linux/acpi.h
>       https://git.kernel.org/abelloni/c/a33bf4b6adf7
> 

I'm dropping this as AI seemed to agree with you but acpi.h has actually
never been included twice in this file.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

