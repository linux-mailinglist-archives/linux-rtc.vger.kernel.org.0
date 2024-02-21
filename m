Return-Path: <linux-rtc+bounces-704-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F5285E8B4
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Feb 2024 21:02:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D6171F2991C
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Feb 2024 20:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE1BC1272A0;
	Wed, 21 Feb 2024 20:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bLAOop5P"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181BB1272B3
	for <linux-rtc@vger.kernel.org>; Wed, 21 Feb 2024 20:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708545733; cv=none; b=dUKIaUUWJn9Ynyu2h8HhdLKKTuyyns0e2ypdCVQ2qL/tgm56LAvvGXj9YgG/tskaCfAQCOVPCi0P7H8KorLC1YKTM/Fr91UN+dEhX6IEBv4veLZApueSR+Ik54OdfembRDq1/T21+//zMwYee0K0UIXm5Un4IR/cu0dzH/Zlta0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708545733; c=relaxed/simple;
	bh=b48lXPZQ+02Q0x3yLHzWYedk9fLZtBBvGY00YBRj8DY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jU/0i5KBDwTt3u3T5Zyj/c8CWNYmgDusFnb7LItyQf1xJlfl03vUU9CSIXB5jn1EVClAZXZjJLjVcJn19WREJlk29wfkck0jQt2/A6678KvkwR5zaeEl/lCqdGLTOJAyODwEliYjQrYnH6x7im5idra9VEYK4mLcPYeFoMBkH14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bLAOop5P; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-7bfe5aa702fso35877439f.3
        for <linux-rtc@vger.kernel.org>; Wed, 21 Feb 2024 12:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708545731; x=1709150531; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hW/eD+217SwbFSrd+7OlcqgqqQaX2xcDsJgsLrnW3ms=;
        b=bLAOop5PY9nIMWtJBK0X4o+9ohSJFVebjUsn5fEj/Pbi+RE3nBNv6UFiiGyj6gA4VP
         pw/74OJosTSnESt4IkCbHrL0tmvqRKVB5IvGRf9Nm8/XA8ByA7rBWnFCW/e+zoGfCNra
         gqu3oc9ctgVEHwA5BAptS2Br5zo13+P6//I5mQS6ApOiXciEAiNr5iQXdGMvSak2iFqq
         xzAmtlZRJx5Yd6RPxRa5QN45nmqIt7wH9SBhG7NwCB8v87ZmeCSNwvAarFSFN7cr4nOC
         6VSfgJLNSN2sTx5EDAcjRtb4F1wjF04ac1lIpq+fCMpOA/TZVcInz0aPFxfP6sNTsMUX
         GnXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708545731; x=1709150531;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hW/eD+217SwbFSrd+7OlcqgqqQaX2xcDsJgsLrnW3ms=;
        b=ZR2e+EuG9lFj4GAxSLFxlTYcx/2LUMidTSXUOf48k9cN4aNwjHqkiPmJKft7eY94kZ
         MAQPjI07dQK2AhxyteqBRR3S/I7R+LL+tWqoiQuufuRiTahJ5YemCj30ncvarZV35QoV
         wAB27auRN9dHtO7M78qbia8cgTHlu4LefS+HjEA+hTALUo/3NqCZnKFngC1Y12OwZgRc
         KfJ44wXpnd8v1/DkB8TKUuTuq7C6XF1nWacVdcjIm8IRz7ugtQtfa/bgxQzmYYcz0zdX
         aPPLshd9oU5Uu/Y0BxVwyMP9owxf4ylcEfiyIB8uCLrWY075qAV7jYJcoyYz3V++5eIF
         tg2A==
X-Forwarded-Encrypted: i=1; AJvYcCWELB9Y36ihXzXEa1Z9k31gKylNtuF+m77QpzYUSq/TvBb/vaDwG8s6d8B6BVKnzqc2J12BelEN5fKrRl9tlfJRR1RMlQoIIp6k
X-Gm-Message-State: AOJu0YzjXfqORuQcmIiNLKIbWmMw64p7NUak4H/xlIzP5UQO02L1JW3J
	iKAcS4cqI337mJlyIWZTXqfisZ9gztR+u0QDhH1bgPXsuqCafdtjU26T0l9EQw==
X-Google-Smtp-Source: AGHT+IG39BbcKPU1il8vkTs2a8eXqdOP0Ld0XjhZHI7TKaGTsFOA7fu8B9CXr669y5rm4dsiJ0Wmbg==
X-Received: by 2002:a5d:929a:0:b0:7c7:4d7e:de87 with SMTP id s26-20020a5d929a000000b007c74d7ede87mr10763875iom.1.1708545731187;
        Wed, 21 Feb 2024 12:02:11 -0800 (PST)
Received: from google.com (161.74.123.34.bc.googleusercontent.com. [34.123.74.161])
        by smtp.gmail.com with ESMTPSA id fv5-20020a05663866c500b004741f7683ebsm2243287jab.154.2024.02.21.12.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 12:02:10 -0800 (PST)
Date: Wed, 21 Feb 2024 20:02:04 +0000
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
Subject: Re: [PATCH 9/9] kunit: Annotate _MSG assertion variants with gnu
 printf specifiers
Message-ID: <20240221200204.frzov7n5bxb4cekd@google.com>
References: <20240221092728.1281499-1-davidgow@google.com>
 <20240221092728.1281499-10-davidgow@google.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221092728.1281499-10-davidgow@google.com>

Hi,

On Wed, Feb 21, 2024 at 05:27:22PM +0800, David Gow wrote:
> KUnit's assertion macros have variants which accept a printf format
> string, to allow tests to specify a more detailed message on failure.
> These (and the related KUNIT_FAIL() macro) ultimately wrap the
> __kunit_do_failed_assertion() function, which accepted a printf format
> specifier, but did not have the __printf attribute, so gcc couldn't warn
> on incorrect agruments.
>
> It turns out there were quite a few tests with such incorrect arguments.
>
> Add the __printf() specifier now that we've fixed these errors, to
> prevent them from recurring.
>
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: David Gow <davidgow@google.com>

Reviewed-by: Justin Stitt <justinstitt@google.com>
> ---
>  include/kunit/test.h | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/include/kunit/test.h b/include/kunit/test.h
> index fcb4a4940ace..61637ef32302 100644
> --- a/include/kunit/test.h
> +++ b/include/kunit/test.h
> @@ -579,12 +579,12 @@ void __printf(2, 3) kunit_log_append(struct string_stream *log, const char *fmt,
>
>  void __noreturn __kunit_abort(struct kunit *test);
>
> -void __kunit_do_failed_assertion(struct kunit *test,
> -			       const struct kunit_loc *loc,
> -			       enum kunit_assert_type type,
> -			       const struct kunit_assert *assert,
> -			       assert_format_t assert_format,
> -			       const char *fmt, ...);
> +void __printf(6, 7) __kunit_do_failed_assertion(struct kunit *test,
> +						const struct kunit_loc *loc,
> +						enum kunit_assert_type type,
> +						const struct kunit_assert *assert,
> +						assert_format_t assert_format,
> +						const char *fmt, ...);
>
>  #define _KUNIT_FAILED(test, assert_type, assert_class, assert_format, INITIALIZER, fmt, ...) do { \
>  	static const struct kunit_loc __loc = KUNIT_CURRENT_LOC;	       \
> --
> 2.44.0.rc0.258.g7320e95886-goog
>

Thanks
Justin

