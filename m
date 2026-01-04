Return-Path: <linux-rtc+bounces-5638-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFEBCF0D6D
	for <lists+linux-rtc@lfdr.de>; Sun, 04 Jan 2026 12:40:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DAA9C300EE6F
	for <lists+linux-rtc@lfdr.de>; Sun,  4 Jan 2026 11:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E0C7287259;
	Sun,  4 Jan 2026 11:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T4okUE7t"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A4C284686
	for <linux-rtc@vger.kernel.org>; Sun,  4 Jan 2026 11:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767526834; cv=none; b=nGzfMESMDXq42hAKO+Ssoggovdo08sqNHqn1ZrVm5t4+os0bbeb0lCiNRmF9qbJu31nUxS2CXiyHL1VI/vxDr/mxIQZGAYfygjT8pNmMN6JgEvqqtoRwbNC2//GDQF/Ez06lcuNyTfrcFdA8HFHnwTJgGaDA/fff63J5K3Hl3LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767526834; c=relaxed/simple;
	bh=AdLaEbu+CLiQdTtmMqeBoK5MYppvfGHNfnURahOocNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B+26mDosxDbgSR+99VvkbinvjvhFgd2cQYeLdNa0jzvdGXTAg0XRrXq0zydwPaK7BVK5GxvSdVl9wgeuqId1cAVgWwlLwD/GkibPgf/gzCO2pNj8A/1sK3g2LOeqLEqp+XdysEs//E2qemSep0pQuzKWFOcmjF8R9IWukDQZSiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T4okUE7t; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a355c8b808so13488375ad.3
        for <linux-rtc@vger.kernel.org>; Sun, 04 Jan 2026 03:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767526831; x=1768131631; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OOiR2u6mlLJSl02K2L/VerbaqrkSVNkTdi5KWJEftGE=;
        b=T4okUE7t+I9TqDuCLL+M/tpNw3aQ5bD15V8iH/q2I7xh94TiS4QUyiRr3+89ppVnMN
         JOv7Rr7QCkzALUbgerC75tarvJqQJnAjftb8uKP7fPGWmmkaJ+u8qYROB2H1AaX4Z+AR
         ok9B3jKLInItr78KbYbQpNEYGBvRvlrdF3qBaqHuC3C6eOvwQ9hw1GP/hOgAvenpUwxf
         kocf/ALJU2c+65fwEXTm6bGGkm62ryKuZ9bppCkX++4XmtikAAbq4gB+YjJj+jXXHIfY
         5haaCJuLbJTxh+vSW4FL/lAGiSSyVXuKthAoY/qgduRNPppGsTId46Hud7r6fp76WH32
         sZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767526831; x=1768131631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OOiR2u6mlLJSl02K2L/VerbaqrkSVNkTdi5KWJEftGE=;
        b=YA6eg7AqOLzDK9lgXQuiTvz8smTv0/lDoMZSVwF4U48d0be/EkrWN2ydBWNXljwvkV
         Q8S6Gt+ArJeY+pUHcQNyMHTGOhQpSfCLNZLqULoYLaWPMjlAHMB5qQwoosp6oP99xTRo
         dgL2fncKpxyUlYJpoWWQBpBXSVi56T52Se33jZFOCYjU0BQPabTN/tINMmv//BXE5fs6
         6Pimv4BW/Y5KxWZW5ZrXT9YRBI6F0rZ5jaVuOn+M3IvANHR7c1/3iyjCgDMaISUBFpgd
         d+xZWerw19PAxMwCqEyA+vXlhInGyHniDAiP8N3DOq1LBYPnB0UfoIYnkdkSDkeru4hd
         adKg==
X-Forwarded-Encrypted: i=1; AJvYcCXEJs1gpIqXjS8LtG6owu9Cf+cxZp3EuzWmPCzMnqwUIqCQk6S7GkmGwjzxrAYMXxBFMCMOMxgoPbE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxAJQ3jdEYls0cXK/tU94WRN6mmlt+5gmaoNSnOksWIcgABre1
	Rbihtw3PtKDVE7fLvYBciOz5sZxK1QHshQZEiRBx0LtBo20PoZQUWoxkO8CBop20KZ8Gs4F/sZU
	Ere4vNqAvnU5L5andYSIFXIJpRU1wHVM=
X-Gm-Gg: AY/fxX7syUMrjWmiv4GoXP8z0OAehCaq1QWh8sblEr5u3TKHtZnnw6K4B/bBlJnVTtp
	1tSMwLfnO946HcjIUhYdMLiAVv//as1tC2PTsMjQgnBJdyj9TIY4EvUxpRTPkWZZxssTtS1QVqP
	S07fLoejvm1ARSi88fw/H99b7HA46u9haxm1dfL/GRepG5kgh+yl4W8P9xzbCmdsLXibrndLzMN
	8fZf5+M1r9ujFTEtYZ9yTMBIN8KD2oBbXkJ52jjdarhl+TJDOmO6Cw27oM5g3vfgPUddpiZy7Md
	q7n03Mzb0OGhFmRn6KepvBDryKngXf2iFG9d092N5qEmOM3vVhWvde55a4PL9m/1/EGRdkd7jkS
	k2SCXUetehXJuxqQP2mSCp5M=
X-Google-Smtp-Source: AGHT+IGZNGJXWeGUy0qD/2ZZlBLns4S640emjlxF0i1BMJssLEDYehJ0Tyk52/9hDWEGz80hiiY9y6axy5gmUTKV/qI=
X-Received: by 2002:a05:7300:c695:b0:2ae:5f73:1968 with SMTP id
 5a478bee46e88-2b05eb7b6d1mr15977856eec.2.1767526831057; Sun, 04 Jan 2026
 03:40:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260104060621.3757812-1-sunke@kylinos.cn> <20260104060621.3757812-5-sunke@kylinos.cn>
In-Reply-To: <20260104060621.3757812-5-sunke@kylinos.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 4 Jan 2026 12:40:19 +0100
X-Gm-Features: AQt7F2oEoZEFUpXfnYcIBsrd_YW6Vf92sLDWAC2rt0GMlus4l9UQhJ5Etusj34M
Message-ID: <CANiq72=tk1=qM_KMOKJeWj32T85ogJUZbFpiSZkABaUPrwB3Hg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 4/4] rust: add PL031 RTC driver
To: Ke Sun <sunke@kylinos.cn>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-rtc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Alvin Sun <sk.alvin.x@gmail.com>, Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 4, 2026 at 7:07=E2=80=AFAM Ke Sun <sunke@kylinos.cn> wrote:
>
> Add Rust implementation of the ARM AMBA PrimeCell 031 RTC driver.

> The driver uses the AMBA bus abstractions and RTC core framework
> introduced in previous commits.

Cc'ing AMBA (Russell) here as well, in case it is useful for context.

> +       depends on RUST && RTC_CLASS && RUST_BUILD_ASSERT_ALLOW

> +         This driver requires CONFIG_RUST_BUILD_ASSERT_ALLOW to be enabl=
ed
> +         because it uses build-time assertions for memory safety checks.

While replying for the Cc, I noticed this...

One cannot require `CONFIG_RUST_BUILD_ASSERT_ALLOW`. If you need it,
then it is because some of the assertions are *not* true at build
time, in which case either you need to fix them so that the optimizer
can figure out that they are be true or, if they are intended to be
runtime assertions, then use something else (likely normal error
handling).

Put another way, one should always assume
`CONFIG_RUST_BUILD_ASSERT_ALLOW` does not exist, i.e. assume it has to
always be `n`. That config is just an escape hatch, and one can
consider it may get removed at any point.

Cheers,
Miguel

