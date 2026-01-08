Return-Path: <linux-rtc+bounces-5702-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF16D03440
	for <lists+linux-rtc@lfdr.de>; Thu, 08 Jan 2026 15:17:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3AB6F30677FD
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Jan 2026 14:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EB5E40FDA3;
	Thu,  8 Jan 2026 13:56:42 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA4D40FDA0
	for <linux-rtc@vger.kernel.org>; Thu,  8 Jan 2026 13:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767880601; cv=none; b=Zasdka1cosxOHvYfh9V06BM4VMv9ZxYRByY4epXyllPyZJQqasNt8a0GjazDmdJooO1mXmWhuT/XpR/G4305jlZRBIVf6bN+s0T3EqM1jPkpxpiGrt5QLxqYOBbymFz+jwvNmsLJxbP14LqoS5calmZLdky1qfTrMGeHXH4+2dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767880601; c=relaxed/simple;
	bh=fPPPbUJkQ4+IX3VALp8am8G9a9TOEFKO/5P0HygmaU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WZWUcNsGDe64VRKqEGpt5L6Fqd6QOxTbJ5t1pRSbm3nVguMCUEDRAaLo472jzU8P/vJUrd/co9bZHA1zdJ0t6MEWtA6PGGBSR3FLx9mMvt1LjafYnVX5T+fRO0ilAyouMZhWUjNFw2HKRKfD5kDR3ZoUF67edxI4ot+XESF96lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-64472ea7d18so2396103d50.2
        for <linux-rtc@vger.kernel.org>; Thu, 08 Jan 2026 05:56:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767880597; x=1768485397;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mCQ6woFsUHpMLtRLuq9gP/vCcs+VuUpNB9iIDA09exU=;
        b=L0dYDrUTLTbLupVGtWUY5xzym3ENjsPWgEH6f+JKDhV5eOYQqiCHOTbdwnLcPPSfqw
         nU/ngGXD460ys0Nc6e2iy//B3PsBF3zxJ4Vii4e+UGytODlRh58VMekMXz2se+7XVGw/
         up+Octm79UMEb9ffplvudNJZ8fM+e4uJU9JXW94PcAu+Xiij8iOGvYw8oVfogDcSCIGz
         cIwEthzt5zmVwnyBXNMeOshMEkr2UDzWmqsW/ZzpKrQcAFxT7RQo8/ATmfdXN8izivxL
         NUBl0pbewqyO6IXMYPsLueJ7W217Lx2ruGvxxusRm1E2vJQ0bGpXUfgZeprD40/q6F4h
         BuNg==
X-Forwarded-Encrypted: i=1; AJvYcCUWOEUV7VH0hz9CopO2IYc/6m6Iimr94uiCvAiAuOqoAwt7LCWghMvvigFJ3aG18FJdMdRMRI1cibw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMBy1ZUbuirhcLU6F1kzbYwOEkuhVj/twqJwrUx9GkZshfegXB
	Y3lmcQITizBuO2Bt5nsVxl07aVrxSEN7UM43WW2LKbGfOqV7DWUFvtvm
X-Gm-Gg: AY/fxX4EJjTmq9fTxvo9MV6+F6+ZLFoBMkTEQQY2TqDj6Mw2ifyJ9tjqUvyDsUQrCJy
	BW79D+QI9a4cB6hkNbEp89U7nGS2kiqR7I7i/4bli1o+fe/odb9kyOmSBtpx8FLigTVe+5bCuju
	CjhxpfD6K3U3cPWfXE1IRShoLUHVlP+DgQpR7XgR4zGcLcKt8FjFflmMJ+A4znRB3Z/btdhiinU
	aFadW8z0NQjrc1XdbhWSHmPZS47aYz9+O3yUM/sEVRAmq0BJTuVEGcNaHVMy3QMv4Nz+RnCzZTR
	B04ForaK0Rf8KghDa+7ed0SHOHFzXdYt3loKI2m5h9xSXHOgPoNt6B7iqZ+LTfjHMRJzdgiHc8y
	I5gzjgIXc+OpRrdJMJ3I4jpxJnoLpR1WaBCmQKS6pz0Pm6HtrLhb/peZkmtliRxfasnU=
X-Google-Smtp-Source: AGHT+IHpibfp8K27fPH/lotcIiTfjq5o2u20YS0w3ehhwDZJwr/juInfop7O2bIGoVgMhV/uFDyjWg==
X-Received: by 2002:a05:690e:42dc:b0:63f:beb2:951b with SMTP id 956f58d0204a3-64716b94f0emr3733733d50.42.1767880596802;
        Thu, 08 Jan 2026 05:56:36 -0800 (PST)
Received: from [192.168.200.2] ([2a11:8080:200::1:10a2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-790aa6abc01sm29272627b3.46.2026.01.08.05.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 05:56:36 -0800 (PST)
Message-ID: <4a3b9aa2-cfed-4cc4-b0ad-d3b257cbf106@kylinos.cn>
Date: Thu, 8 Jan 2026 21:56:27 +0800
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 4/5] rust: add RTC core abstractions and data
 structures
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, linux-rtc@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Alvin Sun <sk.alvin.x@gmail.com>
References: <20260107143738.3021892-1-sunke@kylinos.cn>
 <20260107143738.3021892-5-sunke@kylinos.cn>
 <DFJ6P0ITWD1O.2PAYKPU63UFFC@kernel.org>
 <b69749e0-e66d-425f-9d95-2d1bd4104e19@kylinos.cn>
 <CANiq72nbBKpa_n8i1pwoC7yiurDYJQtY1efRqkvtXMZ1sXSfJg@mail.gmail.com>
From: Ke Sun <sunke@kylinos.cn>
In-Reply-To: <CANiq72nbBKpa_n8i1pwoC7yiurDYJQtY1efRqkvtXMZ1sXSfJg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/8/26 21:49, Miguel Ojeda wrote:
> On Thu, Jan 8, 2026 at 2:17 PM Ke Sun <sunke@kylinos.cn> wrote:
>> Yes. Dirk suggested doctest in another patch series, which I enabled. I also
>>
>> run clippy checks and QEMU tests for every change.
>>
>>
>> ❯ cat .config| grep DOCTEST
>> CONFIG_RUST_KERNEL_DOCTESTS=y
>> ❯ make Image CLIPPY=1
>>     CALL    scripts/checksyscalls.sh
> It may be hard to see without syntax highlighting, but the code is
> commented out:
>
>      /// // rtc.set_range_min(0);
>
> So that is why the example "builds". That `rtc` variable is not defined.
>
> It is also not well-formatted.
>
> Please manually double-check.

Will do. I'll check more carefully.


Best regards,

Ke Sun

>
> Thanks!
>
> Cheers,
> Miguel

