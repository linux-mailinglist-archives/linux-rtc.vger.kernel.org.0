Return-Path: <linux-rtc+bounces-5654-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4695DCF71A8
	for <lists+linux-rtc@lfdr.de>; Tue, 06 Jan 2026 08:44:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 061663001875
	for <lists+linux-rtc@lfdr.de>; Tue,  6 Jan 2026 07:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 938E530AD0C;
	Tue,  6 Jan 2026 07:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TnpIEhvC"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F3E30AD0B
	for <linux-rtc@vger.kernel.org>; Tue,  6 Jan 2026 07:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767685319; cv=none; b=HmlsR6rfGiiwvXfeNHuT4HqfXNzqNeDBzLg50EWCaNseaGsUDCbS1RuWQvNbuvPowCme5v1JCu1NBYEC1fEJumpjaj5Y+UsW6AgpT1UwjOq5ayxf4kzRjom3mrxYLGiqNz/IFtItukfS2GJ3lK2Q2SRnnrxqwnIwQ7T/KRWaYCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767685319; c=relaxed/simple;
	bh=Hphfbtc2MHIAmRuXaqvQIxip8ijKFhRE+MI9ASMBHDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gO8ug2CMfUOyAKcxB/mGSC1uBDToxwTQt6e/eCBxowx7YTrWGAbzj/xpFHK5L/Hrh32jZvT2BShmWIm086cvnIDq2GkFdmxKBRAPmnA+vYkGkPkWoccm53w3UBjpd/ng/dgEohQzLdDqEHkyy41ywG/4zsEQZjF000GXDJb+dVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TnpIEhvC; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-45a3145faddso260905b6e.2
        for <linux-rtc@vger.kernel.org>; Mon, 05 Jan 2026 23:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767685313; x=1768290113; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pwfwDhqpeGk19TmwTm6HhHDgzhA/lFQ/uiV0WkdPuR4=;
        b=TnpIEhvCJHyXLey1TBVuG65KfHWo4RQGojNaKxa+hYdVuYctmsE5z3qCJVeGoFsVzl
         Alp9cIGssrzMlxuW0KfvoiprtIJTlG73ZkjlJjy8Xygjxe9H9hNAFfNN9Vz0/BsVwI/0
         AbtkRntezWTci44H1tqZm/liX7zhbHrBBYDFd36jeffeOKa3SZWpwyyLW1Ka7qIML38H
         eWtWoqUZkSV/N7CNiN6EMXtsD53yCnh1GQPgljsOB5P5pf157ekDsb8NnNr/YoxXDDev
         l5hJVtfmtoV/f26eFuD7Wymk2RccVd3wdAElsllOjCiLoAiKO65Xb26r7lphgaT86hpn
         agsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767685313; x=1768290113;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwfwDhqpeGk19TmwTm6HhHDgzhA/lFQ/uiV0WkdPuR4=;
        b=GhwobtrvWHz7R2Xj407aRtyuS+iuMh+0gAphAIssp1+NBhB+tGjaFr+54R9jiHyX/E
         9MrThQXZGHXbnf3nrDyJXigzPyIFQEdPagPL6zCZvOzYSpWrgsh2QdL0zTEUv1XbtzX/
         K5zM6SPLUkCSHZbanKhTm0qNpXEBaDhlsQ7PGXJOiSCG4BmFleAhosx4382OEkDp6+RZ
         kOo5FnU3+SdJTvfo99w9LB16Z+ypKPLYQni5ITzhyLMJ//iyT/19owIArI51VmUjXfkO
         BhRh+a/4jY2dFnIfWZ6TNI60P7r91eSvaQdRe8WExBGTC/0DMaBRrAihy/OJueM3irnt
         Q7Tw==
X-Forwarded-Encrypted: i=1; AJvYcCViuLkCuunzZrdctkgXe9Q+2xBauB6oKC1VwTXwPDWji9vExN6AOXBg3qLZ66sh9t4FAFFY/eQYEi8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLwPGdZI/knF8szwR9gDSoGxco1QYRRNcg7aP8wsr6mDptNvqE
	7spiWHueCPk6yJXHrS0rkHQKFAaAGRst2R24fHe2X+xHaw5skvZGTL61pkmY2FSQ
X-Gm-Gg: AY/fxX63KF7IcBg5QBrHLv856+QcW3e+69ALlPl+Cjke5eLzsuYneSmHsnXsJiyrhBS
	jMicIxAGbm0oFjMsHqSlxLuzrSkOrXo1YbXn81hvPOAnGOM4n9UpEFekP1lSqw5vfIFEsEcE7F0
	Ji7qpVCWQyxGZXCSMWIOaw7zV87BWfG5+o4tw3Oz71BENsEeGwdCtE2SnIBaSZxyVybLac0nmU1
	rzrghv94+M4H0BeXz/g1cm3wlhw48SPnpDDRUpG2gKX7QzFIFZHsC61XEDlZN3jMAbmBKR8Hl/x
	1hPNrTdSXaxQ9k6wdLiyMnw355os4iEsD/GTgMNFQ2gLp0NgMqcoqS6YJvomY9zZa4Gs7YpcEwg
	hDXHDa3OwGr1Htrp2he9b1TUWgy8qhk7XGtT0J5aGCCScrylw0Et3ipNEyy4yK/aAZpxESBw1bU
	/TvmO2ibzwqKhVl4Vw3b0TiG+i1HfDgca2Hb/ItsFQ+K+h3f6fDG3aSNqb
X-Google-Smtp-Source: AGHT+IGvF1u49dlKok+cnqawxAS1tK2dchRL0Z/g8KiXMAveqyTL+/W3rliQvP6FNeFUkaXtysaKOg==
X-Received: by 2002:a05:6808:c3f3:b0:450:b0b2:96ea with SMTP id 5614622812f47-45a5b1e9b36mr1402575b6e.1.1767685313580;
        Mon, 05 Jan 2026 23:41:53 -0800 (PST)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com. [209.85.161.53])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa4deae43sm890651fac.1.2026.01.05.23.41.52
        for <linux-rtc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 23:41:53 -0800 (PST)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-65b73eacdfcso160577eaf.2
        for <linux-rtc@vger.kernel.org>; Mon, 05 Jan 2026 23:41:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUvcqWcuPuXv3hUuvZcNssubziTvO0XkLCy4gHdXMNzF5DB7xcqRFrReu9OE07SV1XrqkSDBL09pNs=@vger.kernel.org
X-Received: by 2002:a05:6820:518c:b0:659:9a49:8e58 with SMTP id
 006d021491bc7-65f47a16bdcmr911392eaf.40.1767685312559; Mon, 05 Jan 2026
 23:41:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260104060621.3757812-1-sunke@kylinos.cn>
In-Reply-To: <20260104060621.3757812-1-sunke@kylinos.cn>
From: Kari Argillander <kari.argillander@gmail.com>
Date: Tue, 6 Jan 2026 09:41:41 +0200
X-Gmail-Original-Message-ID: <CAKBF=puv6tXX-CfsM68Q8C1oU4WkcGZvaFCW21rNn-yGSt=1Jg@mail.gmail.com>
X-Gm-Features: AQt7F2o7oyWmJKdfg4043_cIdEZu2Obid0oDdM3mINzPMEpcdBXgB3IFLJ3SZIU
Message-ID: <CAKBF=puv6tXX-CfsM68Q8C1oU4WkcGZvaFCW21rNn-yGSt=1Jg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/4] rust: Add RTC driver support
To: Ke Sun <sunke@kylinos.cn>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-rtc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Alvin Sun <sk.alvin.x@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 4 Jan 2026 at 08:06, Ke Sun <sunke@kylinos.cn> wrote:
>
> This patch series adds RTC (Real-Time Clock) driver support for the Rust
> kernel, including the necessary infrastructure and a complete driver implementation
> for the ARM AMBA PrimeCell 031 RTC.
>
> The implementation provides a generic RTC framework supporting multiple bus types
> (Platform, AMBA, I2C) and demonstrates its usage with a complete PL031 RTC driver.
>
> ---
> v1:
> - Add AMBA bus abstractions
> - Add device wakeup support
> - Add RTC core framework with multi-bus support
> - Add PL031 RTC driver
> ---
>
> Ke Sun (4):
>   rust: add AMBA bus abstractions
>   rust: add device wakeup support
>   rust: add RTC core abstractions and data structures
>   rust: add PL031 RTC driver
>
>  drivers/rtc/Kconfig             |   11 +
>  drivers/rtc/Makefile            |    1 +
>  drivers/rtc/rtc_pl031_rust.rs   |  529 ++++++++++
>  rust/bindings/bindings_helper.h |    3 +
>  rust/helpers/device.c           |    7 +
>  rust/helpers/helpers.c          |    1 +
>  rust/helpers/rtc.c              |    9 +
>  rust/kernel/amba.rs             |  234 +++++
>  rust/kernel/device.rs           |   35 +
>  rust/kernel/lib.rs              |    4 +
>  rust/kernel/rtc.rs              | 1710 +++++++++++++++++++++++++++++++
>  11 files changed, 2544 insertions(+)
>  create mode 100644 drivers/rtc/rtc_pl031_rust.rs
>  create mode 100644 rust/helpers/rtc.c
>  create mode 100644 rust/kernel/amba.rs
>  create mode 100644 rust/kernel/rtc.rs

These files needs `MAINTAINERS` entry. It depends on maintainers do they prefer
that these are added current ones, made sub-entries or make new [RUST] one.

Probably easiest is just add to current ones and then it easier to discuss about
this in PR reviews. Then at least `MAINTAINERS` entry is not forgotten.

> base-commit: 805f9a061372164d43ddef771d7cd63e3ba6d845
> --
> 2.43.0
>
>

