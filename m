Return-Path: <linux-rtc+bounces-712-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A48F085EB0B
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Feb 2024 22:37:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 099F0B27D08
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Feb 2024 21:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8CF212CDBB;
	Wed, 21 Feb 2024 21:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D0FOyXkc"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C137612BEB8
	for <linux-rtc@vger.kernel.org>; Wed, 21 Feb 2024 21:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708550999; cv=none; b=uMDSqplcM8+Kmu691T8/EM8pGKg/6C5Oqk5E+L4PM0lN/ZXPqTgW/kejzhFuyglx1SPUg5nml8pzfWkCdhrcg4JWiV8VKVJFKYqbu1fHAkYCxKuFcMznyRh+e7qDDj63Mc0l3ZeoWcdmiYXcn17JWUBZz1YDkELpXFMJxYPUceU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708550999; c=relaxed/simple;
	bh=jhbT5Cr5KxXONXs4T6cwnDbtOKqKVBRtP9a65KT+oaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VCDvMgJmgBvREhDQ11vb0YS0UMttnjrsIrSTl4aSDAavCJ86tHJll+UbBHxlpnj1ZebwvncEpCmk7od1qW4ZHjWYXQFqqaMGf08ggEldILBs2i+RO8EMswK/E3CnE9IjuJoXgEUfzINa5TOGyT2sYee3Ar3hAvPPRv98/1CzTJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D0FOyXkc; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-7c77cff6ee8so14278739f.0
        for <linux-rtc@vger.kernel.org>; Wed, 21 Feb 2024 13:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708550996; x=1709155796; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fHJzWSZbaUVkrjgtkdycbYKuoIbcz4QqReZXQuIUTd8=;
        b=D0FOyXkcN99A8U2pypJobo/iI1rVmSj6DKFobDqrZr7YyzHGpvKpwcRQGEIDw6EbPC
         +T4++/maF4JeYetwSfFO1/M/uhMW1BA3g7/eQWpodAJUFczLM1SgEa/ggFfvp+ENwyEU
         0UvCXNhbjPVfWedQ2lVqe+3tPm0k0dQq/2hEQJZlmUS9fOuiy9CKIKwPDyU0Bxi7qK4/
         INhd6nuqer6EPWnAx+EQrbhjntKaiU84ERlIbiNO3i1oV7jrKMNXvYOznFFw1IAURQig
         UVDg6rHDUUQfu57sr5rpsWUSd0oP3nArNmCYR/OK43USKT7O5o2cfmCLOM4gtI4sGOJ7
         XrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708550996; x=1709155796;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHJzWSZbaUVkrjgtkdycbYKuoIbcz4QqReZXQuIUTd8=;
        b=WShfrAvRrkf9TOXJ0dbJ3rn34Do3PcGanq59W+YxJyUKzWDMielfCdZSme4/LGgRdr
         HzZ+GeBrUdTGqQtwzNIohqOtcVvQ7T1mTvhmTaGFkPFTUvgT1ZY7AX0hwMC4usiF2WY0
         vyQTj58gJsD4cBrylWrt6iGDCjSWopyN30eqzSruG32kUxSwULwsm3IK399dpsTO3w59
         r8wEZTAWX4KMf3RCtH/BKoYPa7u0c/6goRePkFZuNhBH8x4jc/THF1jkyZ0917foF0bq
         c2TSG6DvUGAGz/EMbX90oEKaidTVkgwVoAZjN4+O+cXIoQTm9cOYu6G3irM3Q+rOb1B/
         Pq2A==
X-Forwarded-Encrypted: i=1; AJvYcCVQWpRUUwP16wUktRlM75VlpUuCpfy/nv2m054shBykY0tXU9V1lpoKyajEFtFxzGIROCQCYECiU3Y+O3GNlI6VInvpd8l326r7
X-Gm-Message-State: AOJu0YxUd2FxjBsebVEc4qodNgiugsICcg9mz9Tusxec7EHFMFfmdGxd
	D+n8D6RJ4pEHiStepmMIurakG7r4/XbP087pdPYskl4DMPHpv7UbNjgKML8AYQ==
X-Google-Smtp-Source: AGHT+IH3xGOF+O0PatOjKRFVOXKn3+X8AKF5AtBxottFnw4acxjqjkkOFdnbYMdTb0txcBwNyBSoFw==
X-Received: by 2002:a05:6602:3fd1:b0:7c7:397c:6690 with SMTP id fc17-20020a0566023fd100b007c7397c6690mr17957645iob.17.1708550995732;
        Wed, 21 Feb 2024 13:29:55 -0800 (PST)
Received: from google.com (161.74.123.34.bc.googleusercontent.com. [34.123.74.161])
        by smtp.gmail.com with ESMTPSA id h21-20020a02c735000000b004742bbf11c0sm1712244jao.120.2024.02.21.13.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 13:29:54 -0800 (PST)
Date: Wed, 21 Feb 2024 21:29:52 +0000
From: Justin Stitt <justinstitt@google.com>
To: David Gow <davidgow@google.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>, Rae Moar <rmoar@google.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Kees Cook <keescook@chromium.org>,
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Willem de Bruijn <willemb@google.com>,
	Florian Westphal <fw@strlen.de>,
	Cassio Neri <cassio.neri@gmail.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Arthur Grillo <arthur.grillo@usp.br>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Daniel Latypov <dlatypov@google.com>,
	Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	intel-xe@lists.freedesktop.org, linux-rtc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	linux-hardening@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 7/9] drm: tests: Fix invalid printf format specifiers in
 KUnit tests
Message-ID: <20240221212952.bqw4rdz2i2yf3now@google.com>
References: <20240221092728.1281499-1-davidgow@google.com>
 <20240221092728.1281499-8-davidgow@google.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221092728.1281499-8-davidgow@google.com>

Hi,

On Wed, Feb 21, 2024 at 05:27:20PM +0800, David Gow wrote:
> The drm_buddy_test's alloc_contiguous test used a u64 for the page size,
> which was then updated to be an 'unsigned long' to avoid 64-bit
> multiplication division helpers.
>
> However, the variable is logged by some KUNIT_ASSERT_EQ_MSG() using the
> '%d' or '%llu' format specifiers, the former of which is always wrong,
> and the latter is no longer correct now that ps is no longer a u64. Fix
> these to all use '%lu'.
>
> Also, drm_mm_test calls KUNIT_FAIL() with an empty string as the
> message. gcc warns if a printf format string is empty (apparently), so

clang does too; under -Wformat-zero-length

> give these some more detailed error messages, which should be more
> useful anyway.
>
> Fixes: a64056bb5a32 ("drm/tests/drm_buddy: add alloc_contiguous test")
> Fixes: fca7526b7d89 ("drm/tests/drm_buddy: fix build failure on 32-bit targets")
> Fixes: fc8d29e298cf ("drm: selftest: convert drm_mm selftest to KUnit")
> Signed-off-by: David Gow <davidgow@google.com>

Reviewed-by: Justin Stitt <justinstitt@google.com>
> ---
>  drivers/gpu/drm/tests/drm_buddy_test.c | 14 +++++++-------
>  drivers/gpu/drm/tests/drm_mm_test.c    |  6 +++---
>  2 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
> index 8a464f7f4c61..3dbfa3078449 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -55,30 +55,30 @@ static void drm_test_buddy_alloc_contiguous(struct kunit *test)
>  		KUNIT_ASSERT_FALSE_MSG(test,
>  				       drm_buddy_alloc_blocks(&mm, 0, mm_size,
>  							      ps, ps, list, 0),
> -				       "buddy_alloc hit an error size=%d\n",
> +				       "buddy_alloc hit an error size=%lu\n",
>  				       ps);
>  	} while (++i < n_pages);
>
>  	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>  							   3 * ps, ps, &allocated,
>  							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> -			       "buddy_alloc didn't error size=%d\n", 3 * ps);
> +			       "buddy_alloc didn't error size=%lu\n", 3 * ps);
>
>  	drm_buddy_free_list(&mm, &middle);
>  	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>  							   3 * ps, ps, &allocated,
>  							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> -			       "buddy_alloc didn't error size=%llu\n", 3 * ps);
> +			       "buddy_alloc didn't error size=%lu\n", 3 * ps);
>  	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>  							   2 * ps, ps, &allocated,
>  							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> -			       "buddy_alloc didn't error size=%llu\n", 2 * ps);
> +			       "buddy_alloc didn't error size=%lu\n", 2 * ps);
>
>  	drm_buddy_free_list(&mm, &right);
>  	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>  							   3 * ps, ps, &allocated,
>  							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> -			       "buddy_alloc didn't error size=%llu\n", 3 * ps);
> +			       "buddy_alloc didn't error size=%lu\n", 3 * ps);
>  	/*
>  	 * At this point we should have enough contiguous space for 2 blocks,
>  	 * however they are never buddies (since we freed middle and right) so
> @@ -87,13 +87,13 @@ static void drm_test_buddy_alloc_contiguous(struct kunit *test)
>  	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>  							    2 * ps, ps, &allocated,
>  							    DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> -			       "buddy_alloc hit an error size=%d\n", 2 * ps);
> +			       "buddy_alloc hit an error size=%lu\n", 2 * ps);
>
>  	drm_buddy_free_list(&mm, &left);
>  	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>  							    3 * ps, ps, &allocated,
>  							    DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> -			       "buddy_alloc hit an error size=%d\n", 3 * ps);
> +			       "buddy_alloc hit an error size=%lu\n", 3 * ps);
>
>  	total = 0;
>  	list_for_each_entry(block, &allocated, link)
> diff --git a/drivers/gpu/drm/tests/drm_mm_test.c b/drivers/gpu/drm/tests/drm_mm_test.c
> index 1eb0c304f960..f37c0d765865 100644
> --- a/drivers/gpu/drm/tests/drm_mm_test.c
> +++ b/drivers/gpu/drm/tests/drm_mm_test.c
> @@ -157,7 +157,7 @@ static void drm_test_mm_init(struct kunit *test)
>
>  	/* After creation, it should all be one massive hole */
>  	if (!assert_one_hole(test, &mm, 0, size)) {
> -		KUNIT_FAIL(test, "");
> +		KUNIT_FAIL(test, "mm not one hole on creation");
>  		goto out;
>  	}
>
> @@ -171,14 +171,14 @@ static void drm_test_mm_init(struct kunit *test)
>
>  	/* After filling the range entirely, there should be no holes */
>  	if (!assert_no_holes(test, &mm)) {
> -		KUNIT_FAIL(test, "");
> +		KUNIT_FAIL(test, "mm has holes when filled");
>  		goto out;
>  	}
>
>  	/* And then after emptying it again, the massive hole should be back */
>  	drm_mm_remove_node(&tmp);
>  	if (!assert_one_hole(test, &mm, 0, size)) {
> -		KUNIT_FAIL(test, "");
> +		KUNIT_FAIL(test, "mm does not have single hole after emptying");
>  		goto out;
>  	}
>
> --
> 2.44.0.rc0.258.g7320e95886-goog
>

Thanks
Justin

