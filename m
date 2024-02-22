Return-Path: <linux-rtc+bounces-715-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AFE85F13C
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Feb 2024 07:00:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 997ACB227B4
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Feb 2024 06:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89F9D1774E;
	Thu, 22 Feb 2024 06:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="IEC2gufM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01EF134B9
	for <linux-rtc@vger.kernel.org>; Thu, 22 Feb 2024 06:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708581614; cv=none; b=e83iO3Hc/tzSJL1IglQaS2SmShT/e4luQ0y0N4elKXX32vqwDq6Rdfn55zAPABrsdqGiJH/OiV/2YN1W+K2X0KVC5sejAI7BfJ11sHxOAHOIuTd9Hhgst6HYd4/JFyTdy7rRZ6WlR8O4KqnepUhKeepJf0vfu6CIRC9ikDD4uDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708581614; c=relaxed/simple;
	bh=jfydpiinpYlW5lz/CxxcHMi0x0ZILrRNe4+Fx00kgU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dz4x89QzVwCtSwdza9eX/5SPFvTHqeg3jpKmw8ba/g5TATBWsnce5qrEyuol2UDekpviFcqpFyk0MaRhBjuor2+weA40fnydNfM4EkE8Nz7OwwYi7K/Vf+gBHYidnihuakCpWzS1B6NS5khRO4tsViDKLumeenBbtHKpaeHbpCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=IEC2gufM; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5112bd13a4fso603205e87.0
        for <linux-rtc@vger.kernel.org>; Wed, 21 Feb 2024 22:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1708581610; x=1709186410; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CrfADjbK9wBe+Anypf28Boz5+FV1y2DabiZpnaLd2+Y=;
        b=IEC2gufMSinVC27jsu0IJ7ALFiWV9PDw88scIpYamJdobjrdfitx0un16GjbwzY43i
         XBuMIgYmEPSjw6CNZkSVryBLTtV5Minketam57ACNeUZkJX7YW3kI4DM4L91NAJ+oRNf
         irzP2UsYd03OOGyVCftaO468Lez319xvjsEIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708581610; x=1709186410;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CrfADjbK9wBe+Anypf28Boz5+FV1y2DabiZpnaLd2+Y=;
        b=eqPHllE8QY6BW7uFVTbvXwrtB0550GyNVJMiwkOu4YmKzW36ixUdxfwQZWYlWoKBRp
         gRUrnuYWXTuXmj1kNG2IkcOWJkokmBAopE0jL5nAVHCSZz6aqeJfcMgW2sPaPv1rmbiC
         mYrCLMOGpk048XoG30ImpiSnrwIH8HkSaxJ8siuZH3uyNOeYAwHf+8fQWIcOA9oKCsON
         CRY+A+dxwV9A96otu9o7gT0OalCOSP3grdk28nXhC6MUAXdFq0IYDm9UP7Igg8rnyJ8V
         lHEVIzqwCE9hHpOVsTaimh6OG6BPXwRSJpONbXuvJoLqhJk1H2uFdb3GdbQe+SaC7hnZ
         pYCA==
X-Forwarded-Encrypted: i=1; AJvYcCVHE1SXBnBWBmCCTAwREaukHRyhJWpokZyHQn/olXiRjk71R9MUlEMzpptC6qkx2cyFd+q0JrK8DP7q2yTup5uqJQZgpbCTnhVN
X-Gm-Message-State: AOJu0Yycgiyyu7rtguQxc4bQUxo4Ab9962McdpjJUyAVlps2lqsdVUjb
	4Kkt6mFg/bDmGJBIe94DiM9oI+CueP4RenGsgD/FascHuJc3Fqe4+MKC0aVQjkeuqYWljGuh+Op
	uIECl7w==
X-Google-Smtp-Source: AGHT+IEgC74g9CFddlmPHg/7eHbVi7CKoVIBkVNKLUJtTkg0iYXp7xqHVR4ObgholHR7Iy6JpI/OTg==
X-Received: by 2002:ac2:520e:0:b0:512:bb2c:9221 with SMTP id a14-20020ac2520e000000b00512bb2c9221mr472499lfl.34.1708581610671;
        Wed, 21 Feb 2024 22:00:10 -0800 (PST)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id r8-20020ac25f88000000b0051144c7cf9esm1928435lfe.265.2024.02.21.22.00.09
        for <linux-rtc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 22:00:09 -0800 (PST)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-512d6bcd696so500372e87.1
        for <linux-rtc@vger.kernel.org>; Wed, 21 Feb 2024 22:00:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUmNoPmxCe7pd4RSB6fRbW1HnQR0i7uW3MhSIPPM9n7HdGjX5jXkzjCn1kMSXxHgmb7052aQMOq/zoWLhB45SGSZ6hMpFp2OJOY
X-Received: by 2002:a17:906:f0c4:b0:a3e:719b:c049 with SMTP id
 dk4-20020a170906f0c400b00a3e719bc049mr1321213ejb.28.1708581587292; Wed, 21
 Feb 2024 21:59:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221092728.1281499-1-davidgow@google.com> <20240221092728.1281499-9-davidgow@google.com>
 <anz6qjyb2oqkz6wdy4ehnlpoujy4rz2itohpglgfqzadtonxtj@ljakgnqmfxxh>
In-Reply-To: <anz6qjyb2oqkz6wdy4ehnlpoujy4rz2itohpglgfqzadtonxtj@ljakgnqmfxxh>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 21 Feb 2024 21:59:30 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgafXXX17eKx9wH_uHg=UgvXkngxGhPcZwhpj7Uz=_0Pw@mail.gmail.com>
Message-ID: <CAHk-=wgafXXX17eKx9wH_uHg=UgvXkngxGhPcZwhpj7Uz=_0Pw@mail.gmail.com>
Subject: Re: [PATCH 8/9] drm/xe/tests: Fix printf format specifiers in
 xe_migrate test
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Guenter Roeck <linux@roeck-us.net>, Rae Moar <rmoar@google.com>, 
	Matthew Auld <matthew.auld@intel.com>, 
	Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Kees Cook <keescook@chromium.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost <matthew.brost@intel.com>, 
	Willem de Bruijn <willemb@google.com>, Florian Westphal <fw@strlen.de>, Cassio Neri <cassio.neri@gmail.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, Arthur Grillo <arthur.grillo@usp.br>, 
	Brendan Higgins <brendan.higgins@linux.dev>, Daniel Latypov <dlatypov@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org, 
	linux-rtc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Feb 2024 at 21:05, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>
> this has a potential to cause conflicts with upcoming work, so I think
> it's better to apply this through drm-xe-next. Let me know if you agree.

I disagree. Violently.

For this to be fixed, we need to have the printf format checking enabled.

And we can't enable it until all the problems have been fixed.

Which means that we should *not* have to wait for [N] different trees
to fix their issues separately.

This should get fixed in the Kunit tree, so that the Kunit tree can
just send a pull request to me to enable format checking for the KUnit
tests, together with all the fixes.  Trying to spread those fixes out
to different git branches will only result in pain and pointless
dependencies between different trees.

Honestly, the reason I noticed the problem in the first place was that
the drm tree had a separate bug, that had been apparently noted in
linux-next, and *despite* that it made it into a pull request to me
and caused new build failures in rc5.

So as things are, I am not IN THE LEAST interested in some kind of
"let us fix this in the drm tree separately" garbage.  We're not
making things worse by trying to fix this in different trees.

We're fixing this in the Kunit tree, and I do not want to get *more*
problems from the drm side. I've had enough.

               Linus

