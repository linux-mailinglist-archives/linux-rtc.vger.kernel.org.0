Return-Path: <linux-rtc+bounces-5700-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79217D03578
	for <lists+linux-rtc@lfdr.de>; Thu, 08 Jan 2026 15:28:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 59B4130000BD
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Jan 2026 14:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A938445533;
	Thu,  8 Jan 2026 13:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ivv0g3zJ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F74F4418EB
	for <linux-rtc@vger.kernel.org>; Thu,  8 Jan 2026 13:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767880208; cv=none; b=aWM+7Wx992RSq64UfldYGJKQXgNdpsLYrWx5mHWhMGLVeI9SCd+RFL/Q9MKYzNZeTZqmPyHmezqqyhk/7axvuA7uQKsd4B8EGVXBebzqRjK4IG26bbzqUfspVL9nVKtA5DwlygBsmwWD8duzKNGFA+0KuBiIfij4BZOs41JSkCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767880208; c=relaxed/simple;
	bh=pZ8sWmgn5Szz2S9wM8ZeSlEMU+2Rg4zjY9JZiOFFGZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S8rXcdIw5En9cKZKYGGhcs0TAdC+4gXJN1y2YpYow2nQOHgAvnYW91rEXPyvd+HW8/Bn5+68vSAQ0MNDmGchiWfhSusjpOXvfwA2/RtPR7jD2vgpE6ZXWAf/XAGmBuAKfHOSjX40ui/CSZnk6W1WLvciHNz+bS3x4bnHzR42SZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ivv0g3zJ; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-11ddccf4afdso222790c88.3
        for <linux-rtc@vger.kernel.org>; Thu, 08 Jan 2026 05:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767880201; x=1768485001; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNqmz5VIJro5vLTRF9gMBu7RK4uMDgE6f1BI3kJZrQw=;
        b=ivv0g3zJwtN5MzveBkQAQsgztPWMscD6T159X0ZU1pLR8vtY2McFYeLuCKLKMNUnVf
         5sm1pFtxzERhmZk3nX+Hrpgj/MMJpZ0+r8rmK6RwZzNr7o2udgSW0uk7ZofvxTUleNhk
         rm/lWiZHgEJrrZuIvAC/KzCUlSbdRj4aSihUo7yO8ICv0mOixnVaz9rZqMva8RlIfL8E
         RQjgMVhlkVcWw8TZPm0x/H8J1AxRBrRwFxS4L6qeiM2mx4w/bzi5XgXi8UHE4nAOTjt7
         J41zxkGrSpXijqAfPe1R+Zi2AAMFuNfuEZGr0TPEBGqre4YhzD0Xlbp10wa9Fu58SG30
         UbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767880201; x=1768485001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lNqmz5VIJro5vLTRF9gMBu7RK4uMDgE6f1BI3kJZrQw=;
        b=XISoJRZ+62ioPhBNIzpn5ZM/jhMLeGTKWJifoGCIiagHa8Guw+GEiwlyVj4jtimx4I
         SDeKjVO5ibXG8ud/Br1lCw00Mm6QnEu/kk4AH9cAJFJ4yGJ0IUlTz3Dacmq0RnebD8R/
         TgsKv+HceqDxQpwJMyKGXtQbj2Mq5qyDe62czelIehZpUEVFtALkV10O1twMbhMH0HDG
         uHV1+o3HWiiy2lS+rdA7f6ngipiYbZGaayLavisri067xFHdcdmkoqLdTgzsMkGeCfzj
         lgm/bPTtlyxztcT3sLwLhQM5HWsKs5Vc3F+Cyh6lNozwukwZ1Ee64SoJ+g9MoaCsxowo
         PhEA==
X-Forwarded-Encrypted: i=1; AJvYcCWKVH3nenlYF9bjk6jRQe/nBhSVdIyJnqGQ23tp2NsANbXHZJKwArBVJAXhNBP8/B8Vc2zCn/RR3NY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3Jg2aNAxo8sAW7FDRUAji0NnOU82ARP0agANkW3SvLD1FI1L2
	FjwM65DNZ2HGhj8E/Wyru5osWbbB1KIGw4b1C5zVUUxZQJ8M2rI3cenO/aJf3zdpXeUgstaVLnB
	DGgkMsHStJvNtqp/zR2q8fn6qGi6RwyI=
X-Gm-Gg: AY/fxX69B6ltfJUJt/3qDI5MBi43gEaHahnU5C8F9WtdEZ0mUayKYTYwnwThivCQo1x
	qCRg6WUX1sLJ2zLQYiBzpokaOhsNhSa0vgc1AR6d1KSEk378yl/kKoC9ZUqA9BXzusuWCzWDMDm
	SyOAJ4ATo1RuLJGtrtPgzbL5suBkdMKKVBuT/C2FNIYiXaPxJOfEyvN/pwsrIus34M5Jyny3oJk
	FD+rNrPPukuGmGcVggyROBKKAk/94zuluQUT8EOyDv2T/s2prPVVeK1Zf0cjoHv3PGGBpYGDqvU
	i9u8U5TEHW+jK1P4jHga/ZKgaJEQDPLuA3TDAUPhXO96yhw3o3Jj62eG/lXZ4fu78eCvO6MkPzL
	88E/P9Aum/sFJ
X-Google-Smtp-Source: AGHT+IEf9VXNdpjywRFf4w/O/Nbcw55l9wMQR2XTrKMp518i7tM67NlvcL8MZSEGle8gb0yrWDNNafGEgxFZDu5ILjk=
X-Received: by 2002:a05:7301:2422:b0:2a4:3593:2c0a with SMTP id
 5a478bee46e88-2b17d23c5f4mr1920286eec.3.1767880201324; Thu, 08 Jan 2026
 05:50:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107143738.3021892-1-sunke@kylinos.cn> <20260107143738.3021892-5-sunke@kylinos.cn>
 <DFJ6P0ITWD1O.2PAYKPU63UFFC@kernel.org> <b69749e0-e66d-425f-9d95-2d1bd4104e19@kylinos.cn>
In-Reply-To: <b69749e0-e66d-425f-9d95-2d1bd4104e19@kylinos.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 8 Jan 2026 14:49:48 +0100
X-Gm-Features: AQt7F2ojznbjt0eB09XGOEyPyR-nyV2pLf2UI9BlLq3Ug1ABy33etzDn1uq85Ks
Message-ID: <CANiq72nbBKpa_n8i1pwoC7yiurDYJQtY1efRqkvtXMZ1sXSfJg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/5] rust: add RTC core abstractions and data structures
To: Ke Sun <sunke@kylinos.cn>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linux-rtc@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alvin Sun <sk.alvin.x@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 2:17=E2=80=AFPM Ke Sun <sunke@kylinos.cn> wrote:
>
> Yes. Dirk suggested doctest in another patch series, which I enabled. I a=
lso
>
> run clippy checks and QEMU tests for every change.
>
>
> =E2=9D=AF cat .config| grep DOCTEST
> CONFIG_RUST_KERNEL_DOCTESTS=3Dy
> =E2=9D=AF make Image CLIPPY=3D1
>    CALL    scripts/checksyscalls.sh

It may be hard to see without syntax highlighting, but the code is
commented out:

    /// // rtc.set_range_min(0);

So that is why the example "builds". That `rtc` variable is not defined.

It is also not well-formatted.

Please manually double-check.

Thanks!

Cheers,
Miguel

