Return-Path: <linux-rtc+bounces-5300-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E456C4349E
	for <lists+linux-rtc@lfdr.de>; Sat, 08 Nov 2025 21:39:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9ADF63B01F3
	for <lists+linux-rtc@lfdr.de>; Sat,  8 Nov 2025 20:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD3526F289;
	Sat,  8 Nov 2025 20:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Rg3UQ1Np"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BB51514F7
	for <linux-rtc@vger.kernel.org>; Sat,  8 Nov 2025 20:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762634377; cv=none; b=POgePynwQIYAO8RbBEt3UaoivVAY5hWMQcOayn3HLQm41cNUJL6FRRNT3lhjmFDoWEDUE/Y4DUKKs6JboOPDaduxeuXoCUa+XCdR7A7nxT7QA2lqe4nrmrLMGjmhrcMAcxJRQBOHWQGSG9vFknVobwKIokzQBJhYT6jaiF5E/Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762634377; c=relaxed/simple;
	bh=Wtom4ms3ayhPd07f+WUTBRJueh7Rxplgb7XGluaZcfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SAzCzKhZFG2nreGyGyBMpaz+UYDLCXGwV3GpjOsJj81FH8plZkwIt/EwSWxyZbdZI+JR6FnZAXWZVd5Q5PvkPBOCz43sK6Rji8ScQewRpIdwdM+4UjB7j0lTbolmIfQKQGUdFmCE7WmuH1Sbzn64JJEOIV94V8KbTF+jkeiEn3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Rg3UQ1Np; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 20BD21A1953;
	Sat,  8 Nov 2025 20:39:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EBBCF60710;
	Sat,  8 Nov 2025 20:39:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6722811852DEF;
	Sat,  8 Nov 2025 21:39:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762634371; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=qnEtlv3/2aLr45cGMsovwfuoJ2gTycSfcv8Q2vdFF38=;
	b=Rg3UQ1NpjPBrRh0JjILrj8Utk7uo6HMAMDXxvfwb4ZuCFC0R5F+sYn0csI49oEQkR2HfQe
	F+7ewNWhOwOeizUXIIBDHF5LuCPy7ypZV8E2KCH+qDz15WiyG6EuGQ9mGBwz5Kfucla97D
	N5hqpHttr9GO/hpZ2S96Ww96H3beS+X1+KxCuGLV0ezMIZJb7T/n/3HcEIHm6WeUN6K3EI
	yxj+mo4YPfeSxvCc7EH3OKxO+aH+sEhIgDX0iqLv59+WzqBnrkEHMBAH6le19EdYjZ2h21
	KAwIlL7Vl2WodjOvCj+H7N8stnJovJMIhZnjTwyYPwi06sLqQ9N+qM0VjqkaiA==
Date: Sat, 8 Nov 2025 21:39:29 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yuta Hayama <hayama@lineo.co.jp>
Cc: Takao Miyasaka <miyasaka@lineo.co.jp>,
	Naokado OGISO <ogiso@lineo.co.jp>
Subject: Re: [PATCH] rtc: rx8025: fix incorrect register reference
Message-ID: <176263436115.653571.1364095494838419633.b4-ty@bootlin.com>
References: <eae5f479-5d28-4a37-859d-d54794e7628c@lineo.co.jp>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eae5f479-5d28-4a37-859d-d54794e7628c@lineo.co.jp>
X-Last-TLS-Session-Version: TLSv1.3

On Wed, 15 Oct 2025 12:07:05 +0900, Yuta Hayama wrote:
> This code is intended to operate on the CTRL1 register, but ctrl[1] is
> actually CTRL2. Correctly, ctrl[0] is CTRL1.
> 
> 

Applied, thanks!

[1/1] rtc: rx8025: fix incorrect register reference
      https://git.kernel.org/abelloni/c/162f24cbb0f6

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

