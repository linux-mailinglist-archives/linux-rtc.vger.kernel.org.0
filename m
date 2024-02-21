Return-Path: <linux-rtc+bounces-707-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB0585E91D
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Feb 2024 21:36:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57B132834D4
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Feb 2024 20:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1273F3C469;
	Wed, 21 Feb 2024 20:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D8gYa5tv"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735223AC24
	for <linux-rtc@vger.kernel.org>; Wed, 21 Feb 2024 20:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708547807; cv=none; b=pLh1pijyIbXDIW2jv7jH/jra6fEKy/XtNF15mfKM+aBQ/P0Yd3SwzlEA1owHS/TaylHLd4pT4KlCm+z9SVnB+BvzA6x2WMz7kpUX/MGcJzvmxQgDa2lghGKdS0T/rA+UGQ2lrOsKuntw/Ha/RnI8oaOPwyLUNuj+2UU9vYnwV8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708547807; c=relaxed/simple;
	bh=GFhPlma8ElxwHflsLYpQTVGFiMO4B/Q3z9xrY8lb7y0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d+aak2t92wzn/m+jS+IF3b0VlJDOKiR6ILTYHm3TSRU1wjg9oGivbUbdDTRKli2d2WLdBkegBT+2lomaGmPgBo+slvAJPlNEbOJ5eE2IMZQ7xyw8kCJsuSojIQ5GT9OHzfEjJeNrbElb7pbo520SWesConI37NgfSpqfzjV2V6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D8gYa5tv; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3650be5157fso1085ab.0
        for <linux-rtc@vger.kernel.org>; Wed, 21 Feb 2024 12:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708547805; x=1709152605; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8iAiTEgCppjIE3t1disnBeWTtqYJCr/gkvmRX972lsA=;
        b=D8gYa5tv82atR4nKq7RyIK/RhQJAYaMsIAt1OcUvNbWeJfckrrfG2EIAskprTKlVUv
         301DbwTO9I9hhwROGR0CJkklvFvFY4kc5QVPqn8c9wvq84j4aVto7X9p6Dg9To7p7amZ
         wChqDkXUfSa5OOD/+TIULubHmt69s4t38D7ulcljGtKiFUOMKHRwWv7HlVxTHtXsPLEX
         sYe0l9IZdvMlJVRHAEQvXI+dJ8SoGTscCua6tDw7sPh4GU6c+BhJzutnE7GFCip3btNf
         6Dj7S3z41nJCnsfywEOwTsQf2wpfnarg1yNUnfVXr3Ge611GtTrXYCXAPQ6b+2wpn0xJ
         Jqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708547805; x=1709152605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8iAiTEgCppjIE3t1disnBeWTtqYJCr/gkvmRX972lsA=;
        b=Kaw5zWgFn8WDHSsIUsfjFS+wvvXJLTav2o4WQFDhIAC3CX0D5DFPRn+nYBrODm3YKR
         AROzrU1R0s+ooqX49C543dPg1QeO4Icri4iVNbLstbIsoWf0aQsTFTq9WOPorwDLco+6
         29LoxfYIiMVshJN6htSZIlda7eB3k7yYeIipcu8ldM1nZ1/dzExECSxdeBAcvlTrwpup
         b3K7jtFc7EFxpwod5QvlFgq8LdXqIdt3yQO+CvurkS5/BRWzhSxFkAZW6cJo3mSJKLVH
         NV1PRV6he+N8+bK37Zjg9eES5mnI3Rr4kmHMFWMIdPm40xobpq2P9VHvOMGjBJkaFnkE
         AgWg==
X-Forwarded-Encrypted: i=1; AJvYcCXr7TfPQB3wQM5KxqAOipQMHtoDwmnSHW9z3CJ/OMhayB8x9OHnN4Ssxw4HlFykwmp6c+Q8srdoI6GDQilfkJpdI7L8t8J9cJ19
X-Gm-Message-State: AOJu0YyCPwBDvoM00/W8XcPb+kN2qavPEB7WNUBYu/S7tAs5NSOrlAMW
	Pq5NB7uk4BDYTYMCid3+LJhrPF+DenLe1AHkYw9oeVpBOyXVMQm0EcvNWnMXOC0OJMk08E2eLkR
	LXmKJpZkI4jEANqUwrnCBQl+1Ra2VHkSMUHkKyWk1uwZKUeeyWg==
X-Google-Smtp-Source: AGHT+IHkUH8682wBjX2MlXCiKDKRKTZ78A7IDkSZwKh62FAeHimOB2zWqCHjoUmuvZXD72aiFX0+O0WGwp10g7NziwQ=
X-Received: by 2002:ac8:4907:0:b0:42e:660:eb8d with SMTP id
 e7-20020ac84907000000b0042e0660eb8dmr285459qtq.5.1708547393077; Wed, 21 Feb
 2024 12:29:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221092728.1281499-1-davidgow@google.com> <20240221092728.1281499-2-davidgow@google.com>
In-Reply-To: <20240221092728.1281499-2-davidgow@google.com>
From: Daniel Latypov <dlatypov@google.com>
Date: Wed, 21 Feb 2024 12:29:38 -0800
Message-ID: <CAGS_qxpyNVqigHB+kS-1xqzR4BAOQXoMSNS+d5khkLYrkpmOgA@mail.gmail.com>
Subject: Re: [PATCH 1/9] kunit: test: Log the correct filter string in executor_test
To: David Gow <davidgow@google.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Guenter Roeck <linux@roeck-us.net>, Rae Moar <rmoar@google.com>, 
	Matthew Auld <matthew.auld@intel.com>, 
	Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Kees Cook <keescook@chromium.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost <matthew.brost@intel.com>, 
	Willem de Bruijn <willemb@google.com>, Florian Westphal <fw@strlen.de>, Cassio Neri <cassio.neri@gmail.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, Arthur Grillo <arthur.grillo@usp.br>, 
	Brendan Higgins <brendan.higgins@linux.dev>, Stephen Boyd <sboyd@kernel.org>, 
	David Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org, 
	linux-rtc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 1:28=E2=80=AFAM David Gow <davidgow@google.com> wro=
te:
>
> KUnit's executor_test logs the filter string in KUNIT_ASSERT_EQ_MSG(),
> but passed a random character from the filter, rather than the whole
> string.

Note: it's worse than that, afaict.

It's printing from a random bit of memory.
I was curious about this, so I found under UML, the string I got was
always "efault)" if I make it fail for j=3D0.

>
> This was found by annotating KUNIT_ASSERT_EQ_MSG() to let gcc validate
> the format string.
>
> Fixes: 76066f93f1df ("kunit: add tests for filtering attributes")
> Signed-off-by: David Gow <davidgow@google.com>

Reviewed-by: Daniel Latypov <dlatypov@google.com>

> ---
>  lib/kunit/executor_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/kunit/executor_test.c b/lib/kunit/executor_test.c
> index 22d4ee86dbed..3f7f967e3688 100644
> --- a/lib/kunit/executor_test.c
> +++ b/lib/kunit/executor_test.c
> @@ -129,7 +129,7 @@ static void parse_filter_attr_test(struct kunit *test=
)
>                         GFP_KERNEL);
>         for (j =3D 0; j < filter_count; j++) {
>                 parsed_filters[j] =3D kunit_next_attr_filter(&filter, &er=
r);
> -               KUNIT_ASSERT_EQ_MSG(test, err, 0, "failed to parse filter=
 '%s'", filters[j]);
> +               KUNIT_ASSERT_EQ_MSG(test, err, 0, "failed to parse filter=
 from '%s'", filters);

note: if there is a v2, it might be nice to include `j` in the message.

