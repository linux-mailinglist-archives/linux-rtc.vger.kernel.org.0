Return-Path: <linux-rtc+bounces-1096-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA9B8B8B28
	for <lists+linux-rtc@lfdr.de>; Wed,  1 May 2024 15:27:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D81A1C2088D
	for <lists+linux-rtc@lfdr.de>; Wed,  1 May 2024 13:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11A6312E1D9;
	Wed,  1 May 2024 13:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uTNPffqV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8385B5C8E2
	for <linux-rtc@vger.kernel.org>; Wed,  1 May 2024 13:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714570022; cv=none; b=EZfqqax58yUpOyi5i/usHysWI2304aJIVORcZ2pGrkaHMrICaRoYysZGrTettfkd3qzB1VN8Ws9cusMNvYoiF9E38DjmZ6oujd95lps7dBt8kEDGl/EY3YQYkfUaI9O+zPP8u64YYZEsebBrNPjgHhFQuC5QR4z21J0NXxc97Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714570022; c=relaxed/simple;
	bh=ehw6SAG+kbHsliF4OQ8Xm50055J6yx3+DlaZFnM29tg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lbcFPOdnPxlHQRAjhhFA/aBs5PSk/beujFLB0tJ/aG7CJsnEz4LUGPpfom3ovoGaHbkAkOO3TEISmN/uwgmbV5TC7SuPq4PNaR1TLCUH7Vjayxf+hO8kHva/QGBdRSZ6wUCshZtlEYNONVeTTS78oh3CpGXBS6jSQE8s9FTgQJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uTNPffqV; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dc647f65573so15879213276.2
        for <linux-rtc@vger.kernel.org>; Wed, 01 May 2024 06:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714570019; x=1715174819; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6DBcVje7sQJG8s2uu2fApbOLUVVFcT0/1pZS1Vx+f9Y=;
        b=uTNPffqVlUqLjz+4jQmUnI5a0s4/9svKkZ7q3Xq9K4igc+YHeaqeK0fL+B55w91y6B
         Ws0eQFfS7SutYbDXBRzID+gUIKuRL9pQjQ9uCDf52iQLC5EoxTcofh3DGKsfZENz8Kqd
         ynpzjhOsyW7G1MWnMADNHCQ02mwVaxZ6qm7EFcgTs6SCsLvawFiHjVKx6/omS5TNXCx4
         nlzgLixhCgvllAHX067FwE2iVs1riNyLNT7R8Sow1HE5fl4Vm1dbDYCdIPGS29H9g7/u
         cxh2tbc/Gl3qn/BMWHz+kxJDx68QhRb6ZMdQjW6KKxvI9ZudKygzgHDzOaujEEU4Wu3r
         fteQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714570019; x=1715174819;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6DBcVje7sQJG8s2uu2fApbOLUVVFcT0/1pZS1Vx+f9Y=;
        b=nuOc2Su0BucQtM9WwSOOQirKwDS8i071Eq6NnSujcahJebZX6GARSn1ufoN8Cmq/c6
         +3BJZ92bLFGrsgpWVwONUdAMA9wwYyZYmq9tqIXJmmy1NMVLNbcW/0HmKPXpxnHk7c5e
         DG60nkdl+9FpyqcVncquridXm6vzZatzQe9rLqjkNmwjJipn+ztiyy39QMY7qTWR5Ug+
         gi8Iahk+PNb05De8JwmfjPiQk/GgGWeHMKML30RtUvMPmY43gX2syZm9HXMxH+TZXg/B
         N32D4YxDcQBRmMYcaBsVder0dMucYYFHWvbAPTlb4YWgzYsY3hvqtRv6b+3mL8qEei7Q
         ljhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyX4yBkGNgsWEHG82fkRW15Uk1Df51NUysbQg1TYHSPFqCx74c981gA+Ob3WF/X9PkImp9YxhspWQbqI8rVm0eYCVFRqK2PkKV
X-Gm-Message-State: AOJu0Yx1ZlQ/cdd2/MrDML2nS3XqQvAErb+VZEcumd8l737F/VMdyzug
	6cTbEDuOUNF4i4Hbe6IdAhGwdLDweW4M7g6UYgWLnABmVejWIJ77XpHmRRsN7iQ0Qtg76Ql3CRn
	8gg==
X-Google-Smtp-Source: AGHT+IEJWGpbrUgjXt0agMfxl6uH0KA2xXXQIskrVStdJjQn0+KbWAVgSKalUCRrBzWfmm3VN3uGF/mvoZE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:74d1:0:b0:de5:9ebb:bfc9 with SMTP id
 p200-20020a2574d1000000b00de59ebbbfc9mr716769ybc.9.1714570019532; Wed, 01 May
 2024 06:26:59 -0700 (PDT)
Date: Wed, 1 May 2024 06:26:58 -0700
In-Reply-To: <20240430235057.1351993-5-edliaw@google.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240430235057.1351993-1-edliaw@google.com> <20240430235057.1351993-5-edliaw@google.com>
Message-ID: <ZjJDIlQCkzIjP189@google.com>
Subject: Re: [PATCH v1 04/10] selftests/kvm: Define _GNU_SOURCE
From: Sean Christopherson <seanjc@google.com>
To: Edward Liaw <edliaw@google.com>
Cc: shuah@kernel.org, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Bongsu Jeon <bongsu.jeon@samsung.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-team@android.com, 
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org, kvm@vger.kernel.org, 
	netdev@vger.kernel.org, linux-rtc@vger.kernel.org, linux-sgx@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Apr 30, 2024, Edward Liaw wrote:
> 809216233555 ("selftests/harness: remove use of LINE_MAX") introduced
> asprintf into kselftest_harness.h, which is a GNU extension and needs
> _GNU_SOURCE to either be defined prior to including headers or with the
> -D_GNU_SOURCE flag passed to the compiler.
> 
> Fixes: 809216233555 ("selftests/harness: remove use of LINE_MAX")
> Signed-off-by: Edward Liaw <edliaw@google.com>
> ---
>  tools/testing/selftests/kvm/x86_64/fix_hypercall_test.c | 2 ++
>  1 file changed, 2 insertions(+)

Regardless of where this series ends up going, this patch can be dropped as I
already have a fix applied for all KVM selftests[*].

Thanks!

[*] https://lore.kernel.org/all/20240423190308.2883084-1-seanjc@google.com

