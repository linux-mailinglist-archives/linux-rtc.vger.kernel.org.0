Return-Path: <linux-rtc+bounces-5644-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9300CF10FC
	for <lists+linux-rtc@lfdr.de>; Sun, 04 Jan 2026 15:11:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7A1D83000931
	for <lists+linux-rtc@lfdr.de>; Sun,  4 Jan 2026 14:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BA1B1DEFE9;
	Sun,  4 Jan 2026 14:11:28 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890511FC0ED
	for <linux-rtc@vger.kernel.org>; Sun,  4 Jan 2026 14:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767535888; cv=none; b=EJNaGseMSPYZPV3sygWHvmDB0Y81gTJivQh73tLwre1JVcmEuNtLMiKyPpMazKYrkqh5/RvgKmMcDJS3HrZpt8aizHxGmPHKm6edJaflV3z2JUvY9ama8l61V1Sh/+R5SxbUPiAz/hCsBCXRgYQWwMwea4xWgTnV9p4LjGhZaLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767535888; c=relaxed/simple;
	bh=4z7IJ3RmSvfcskfhQP9WT5iJ3OTPq1YGLLMFHPk+nmc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T3IY+qkGAqL49S/2pNVceHP/2/WISfRoYCm12/P1+DlIC9DYprdxjt1fQL+YjHZvsiAGOGvev6dOusxQigOetDbGe5sP4Gd7PShv3fSiiroGs9Yqf76furfKZO8VXLXsuffTcRTMz96+spknAhZHaPkfyqXj2uBfhVwVHXZFJwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a0c20ee83dso170975095ad.2
        for <linux-rtc@vger.kernel.org>; Sun, 04 Jan 2026 06:11:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767535884; x=1768140684;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fsjc6eK6Ijw3K+PY/ztBzmlLit7pc4QMYQvrU9hkkSo=;
        b=f4LiOLHweNoZS0hRgsDF8+5nieiU4O57BnW7nE5hrySXUI030JBmb8/NCF3Z8mMjep
         AaF+PjHnrSnKXG+OLgElo2OsbOEy4mg5PfSODCsKkZ5ARbwjTIRfSTsfFVn+4WpwuvPw
         sxlGUMupEfIx33fB5wbVcbpMJpYU3cX8DEUvFlUDMv1tA26Vwpm0ViZoDN0YS5qCrt/A
         ogT7x2yHC7E8999qheHOOHQG5wuArE31uXeXUo4hQ9Y710XAafrPPGd0R/Pr9lB3rfi9
         2FBEx739ua//TyL95jnvH/aMF67iIVQX/swW8dAWWrRqc8LBfOJK1vglN2Kmr+kRXJHv
         6i3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVSCS50MIOrH/ykyvfUfB37oiiuV7vjIBsa5ws0+QbWmCWXxlyJ3nOKZXXmbnNQiJeODM3P7+Pzazg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+9bVF28fMF+OUUYkYGuBRwmuBQos9xboyZ82ke5Lumu9M6ROa
	YN8XaoJnCUSW7gFe8trB5FdbHIiZ09anTNw0OdjIUypJg5z2BfPhIHWO
X-Gm-Gg: AY/fxX6UB6FD3tdYiEtFAuBwRSQVL6fvBDh0QueQG78iKYH1jSD6Psf5sJWz6uA1SL7
	1h4jOYGEaR3ocpvlviuYbWCyDKXMUa+O9PqWisfU0PpxsHNTS9T44ePMLurAC5Ov0Rv7YlHgCi3
	fj8xVL5i8RAPNfiaf0+lIPPKZq74O5QwPRfdwSiYGi/CRYFGtkPmFTgWJdx+WjCC1gu+UKk4fJu
	a0Ipv0i8GH4oKa/siPhaeF51wHRS+xhrIo1BHC0iV/nSmhU9vCyktwMBoksfOfgkSvKj4K3/Xos
	f+yE+z95gWQEx4cAhLotZrYsOuyc5T4CvNQUfVSK2XmNdi/jR3M1+vACeXM/UKBkq1C5rq8X0Hj
	5K3YeTnNUzScgkka3cGSEosQDg2hbk+rEEXZFnLIpa3zr/3x+m5YYbmwweV8+auZhqDSW6dIjFa
	Gito4bAM+hUO6fgYQ7KCAK8dLiHH3u5KSEYWSPhWxmiA9MxX4=
X-Google-Smtp-Source: AGHT+IFGroKOmEDYNEfnLyvkzjfTn9DXqKx3c2454IZvQ/Ory7G0MmSBQDeDAQKx7j17tBFCUsxJWQ==
X-Received: by 2002:a17:903:228f:b0:295:6122:5c42 with SMTP id d9443c01a7336-2a2f2717b3cmr421307585ad.24.1767535883663;
        Sun, 04 Jan 2026 06:11:23 -0800 (PST)
Received: from [192.168.200.2] (210-61-187-174.hinet-ip.hinet.net. [210.61.187.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d7111fsm418791415ad.85.2026.01.04.06.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jan 2026 06:11:22 -0800 (PST)
Message-ID: <746289fd-a222-4f31-b9a1-a3afd4ea6b7d@kylinos.cn>
Date: Sun, 4 Jan 2026 22:11:12 +0800
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 0/4] rust: Add RTC driver support
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, linux-rtc@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Alvin Sun <sk.alvin.x@gmail.com>
References: <20260104060621.3757812-1-sunke@kylinos.cn>
 <DFFUFRMWKRMO.INAMUGECPSQU@kernel.org>
From: Ke Sun <sunke@kylinos.cn>
In-Reply-To: <DFFUFRMWKRMO.INAMUGECPSQU@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/4/26 21:36, Danilo Krummrich wrote:
> On Sun Jan 4, 2026 at 7:06 AM CET, Ke Sun wrote:
>> Ke Sun (4):
>>    rust: add AMBA bus abstractions
>>    rust: add device wakeup support
>>    rust: add RTC core abstractions and data structures
>>    rust: add PL031 RTC driver
> May I ask how much of this (if any) has been generated with an LLM? Going
> through the code I saw quite some patterns that made me curious.

Yes, I used LLM assistance during development—mainly to help understand 
certain R4L mechanisms. Code comments and some boilerplate were 
generated with the help of LLM.


All code has been reviewed, tested, and verified by me to be correct and 
compliant with kernel coding standards, under the assumption that my 
understanding of the mechanisms is accurate.


Thanks for those. I'll look through your comments on the patch set and 
address them.



