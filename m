Return-Path: <linux-rtc+bounces-5637-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 42052CF0D4C
	for <lists+linux-rtc@lfdr.de>; Sun, 04 Jan 2026 12:37:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 997F83000E8A
	for <lists+linux-rtc@lfdr.de>; Sun,  4 Jan 2026 11:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 306A127F18B;
	Sun,  4 Jan 2026 11:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efoHC7jq"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2412116F6
	for <linux-rtc@vger.kernel.org>; Sun,  4 Jan 2026 11:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767526669; cv=none; b=YWDvGC3SdaRyF6K72uXvb49nR4YowhrcDM9WSU3O4DPB/6nNIQxjoOPbJpLorjlBOJkFNmhGgyrZsweD79WEEgiJe86t71KsnKcpSCjpiB1GfceBAWV/Id6bB+BjwwdJLwrGSC6xWg+s4WA/rlxZEp1Zpq/bGs4O79gu2wZEnx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767526669; c=relaxed/simple;
	bh=KerBeXykzZU7XHQB5Q3TinX8LKvJ9sxVKbdnkQbahpg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g29sMALa8GMkgqY9Ci5gDeyCBcHYLxX+m4ieEtWMy4db5qE0cnSI3tT7Os7XuvlU1012qIAtDzy2LDQ303kUb2X4fssvOm8hCObFIJZ7buN/oYrI8FGe5mhQInI2+7uGxIWfLxGfBiLWTfzr/2UwZ4uoHdlMq9egtqlbDZPT6lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efoHC7jq; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a097cc08d5so35311335ad.0
        for <linux-rtc@vger.kernel.org>; Sun, 04 Jan 2026 03:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767526667; x=1768131467; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KerBeXykzZU7XHQB5Q3TinX8LKvJ9sxVKbdnkQbahpg=;
        b=efoHC7jqyBI+/PSPv1Dmx+WoklK+WNulNhmGp/4jCTxHczXIj65SWKofkB71Z+V2/t
         OwwWS71CQsV8iIDQA6LHCoIRwyeiA3qoZAMJuCGzx2VX5DuiExY4SkliVjaJRP34nml1
         ajgrEG+eCBtEe3/CqMQBoGj/siDBatzS0cMnVsrP5u4e3UY3t11cQgqhqII1JBFHCVmc
         dOHdkc7/VnAbzacyPqdlTLPgURMr6+NN8a4EZ7SjYkaLrUg4cT2E+WgMKQPOdq8Uj27D
         2jO5yOdHW5ofegC9qllSCLCt1Kvj4TLlw+dRvXVGxQO2d+HBFHwsWFs7MuyGGlaye9WR
         nDvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767526667; x=1768131467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KerBeXykzZU7XHQB5Q3TinX8LKvJ9sxVKbdnkQbahpg=;
        b=rydXrv0aE4J95ztV3+UyNxBG8kR1GwYMarqMqqoxkh+sH9/WTfQJPEFubILVBbQLsx
         HXdlLzZ7NZons+n6tEU0ku2OF6vWVDwXU/d6E77kUK5BfstO0nsL5CFcvxgRpDUqjHoj
         DZPgHFxQBE7qA/ZJA/SiOm5iAnnxlSGpO5soY4x1V1v5IEsLpDS/1nssUk1Zr1rATg7A
         sE/DmXeyy5zaMQ/CN7H2YUUxEm3S+Mepx71rJfBQ6rGJpLelP9TEdOwxGAKpZ80/ZBye
         EcKKdBqiwJuxtWKvrcyloAaFeZjNV0v334C90MOoy94Hd6WwiuEoHRNjKp93G6UBnPKO
         33vA==
X-Forwarded-Encrypted: i=1; AJvYcCVBOprBq20jASViJH+11gWx4DQ9mGJERbvuJkmeMS/k44fr634wGg2Uv6ZleDEJsdnZBW6EreyzjCY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRjPcbIUbbG58il0LBNjcieY77IcS+rK13QBBTG/PdB2fRlpxc
	FF/PJR6ugco81eNt288cEjS3aCrikEBGD1eAZGsp08F3i9BsTJn17mA5WNUGQTpNe0ceyVi3o7m
	gp0GYDnielJXl1I8DJIKXtu3zIssNt20=
X-Gm-Gg: AY/fxX5UdTe1A74XzyoaS/EVwLbeeaC64pDgsJ3OJ2eACC841Lpkq70O5wN8T+YLVrN
	1eYt/xR08ys0QOeoxdvFt+VJemnD2psK4qyyFfSP56Uwsh7W+z9r/n1grBZlSTbUWE36zLVXmio
	gbT/APioFDKKNo9VGLnxxZ4EWhK81oN4WwIaNxpEsed9qGQfMuBTn61/nnPBAJGkOnzaa0E/LcU
	+BOJMPkp3TuFj3+onzifSd+/uI/4B3TWPfJkbtEHpYMcOSi0extN+nHAYMB6wY1g4x52n2IwBr2
	DoZa/BLdAsnBeo5sWlKpU39qB0U0EkgAiickR95R5UfqlotqJOwbefYhwtO70pBP8s7Qxq6i0hQ
	igu/VFvELT7qsSCMF+C2g3Jg=
X-Google-Smtp-Source: AGHT+IHJQEfYQFYZCHzNaVYaf4k3PwBgQoDrwPUb1CfbakNqeVpCekMP7uMBgMpZwaA+4ojXGIVTsIceJ9QQJeaSbf8=
X-Received: by 2002:a05:7300:84:b0:2ae:598e:abea with SMTP id
 5a478bee46e88-2b05ec3d4d9mr14991634eec.5.1767526666913; Sun, 04 Jan 2026
 03:37:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260104060621.3757812-1-sunke@kylinos.cn> <20260104060621.3757812-2-sunke@kylinos.cn>
In-Reply-To: <20260104060621.3757812-2-sunke@kylinos.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 4 Jan 2026 12:37:34 +0100
X-Gm-Features: AQt7F2pZYq5M6PhTWyxgL5M6Y51YsXWLnwohh8uE2ggZM4GujkCeu1vdns_Hkl4
Message-ID: <CANiq72mjhP6UDqCadpunwgi0cu-V8vzFqVyUAuy4_wueO1ccPA@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/4] rust: add AMBA bus abstractions
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

On Sun, Jan 4, 2026 at 7:06=E2=80=AFAM Ke Sun <sunke@kylinos.cn> wrote:
>
> Add Rust abstractions for the ARM AMBA bus, including:
> - Device type wrapper for amba_device
> - DeviceId for device matching
> - TryFrom implementation for converting device::Device to amba::Device
> - IRQ and I/O resource management methods
>
> Signed-off-by: Ke Sun <sunke@kylinos.cn>

Cc'ing AMBA (Russell) -- it is Odd Fixes but he should still be in
case he is interested.

Nice to see AMBA interest again -- it was one of the first, years ago
(https://github.com/Rust-for-Linux/linux/blob/rust/rust/kernel/amba.rs).

Cheers,
Miguel

