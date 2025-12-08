Return-Path: <linux-rtc+bounces-5514-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EA9CAE4B5
	for <lists+linux-rtc@lfdr.de>; Mon, 08 Dec 2025 23:11:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5017305E20E
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Dec 2025 22:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 928662E2852;
	Mon,  8 Dec 2025 22:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gZ2VbtlB"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68992E4257
	for <linux-rtc@vger.kernel.org>; Mon,  8 Dec 2025 22:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765231785; cv=none; b=tUP4yok63ZOw+fgTi/EUePVZvaGG7lZT/ZWi45jOajx2lbta0s+mKY6L5Y4LouxwR/ZHlk3bHt/GvQWwJntVO4oG0Sotszk+QrIB4i2+nKEXPq7FzJzDNjhHc9AW966XNuf4RDuqqEc0BNB8vsytpc7ir4B6f2Mnb7ursxsF4RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765231785; c=relaxed/simple;
	bh=U9QlvfwPNH5WFjM5/TymVkul90yJTqJ+pplGeSLCUoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gq0VZ9TsOc5Ys1etE3G2379azXTmQFpGE7hSKHW3Jamyq3KjfQWXRsL/gsrrdaDd8PJu3oitbwSR13eZT9VRAMb8I9ubpmW8O9q6dLbUg/iPN4Ze/9rcgYlptXAVa0AFVZl+tZ5h0wguVCUZp+uxDSy2JBbFAUpzvMsJRO0KoMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gZ2VbtlB; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9E11EC180D1;
	Mon,  8 Dec 2025 22:09:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 66F18606DD;
	Mon,  8 Dec 2025 22:09:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8E80B103C8D5C;
	Mon,  8 Dec 2025 23:09:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765231782; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hiKjBdQE5rROtIMjJvlVvwR8xL1V8JXkVc/ni5azIMg=;
	b=gZ2VbtlBcO2n1UfaPuiFdDgHJlGkxjj/Nu/aXoQ3WCkPoXE5Yo/BqS4QM/dTjQHIiMWhpV
	jLcsbJSqXQ3lC2VqxjgxnJBz9t6YsdiousnS0xE32jMfAAhh2vLIKH9z0kAJGrW7kywDic
	H7/zq6wvJIDjAIbXMe/MOf0faML1pUH1sKSgQ+udH7vYiJSJXWVTEOxaV1Hv/YbuI6YylR
	hI8yO1xAa2Js2XqqIkSIffrQJ3/57S5UUdcAFIuy5fInNXp+F8MfIbbUcMoW2c1T0pCvtX
	6OExKVUWIFlj+dyKRsh/Eu4xwqTDevDT8TVh7EJ+3XxkKSPYSQGtGDEYzKSj9w==
Date: Mon, 8 Dec 2025 23:09:40 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>
Subject: Re: [PATCH RESEND] rtc: max31335: Fix ignored return value in
 set_alarm
Message-ID: <176523152356.342815.8964547831255681971.b4-ty@bootlin.com>
References: <20251128-max31335-handler-error-v1-1-6b6f7f78dbda@analog.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251128-max31335-handler-error-v1-1-6b6f7f78dbda@analog.com>
X-Last-TLS-Session-Version: TLSv1.3

On Fri, 28 Nov 2025 16:36:38 +0000, Nuno Sá wrote:
> Return the result from regmap_update_bits() instead of ignoring it
> and always returning 0.
> 
> 

Applied, thanks!

[1/1] rtc: max31335: Fix ignored return value in set_alarm
      https://git.kernel.org/abelloni/c/f07640f9fb8d

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

