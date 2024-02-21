Return-Path: <linux-rtc+bounces-708-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3DE85E976
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Feb 2024 22:05:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF6151C22020
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Feb 2024 21:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7521378B7C;
	Wed, 21 Feb 2024 21:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nUP0bRhc"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B1986646
	for <linux-rtc@vger.kernel.org>; Wed, 21 Feb 2024 21:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708549541; cv=none; b=GeR9PaJaw0fCI+muTWJAnDnS5nNrWJHNsxM1OXOOg9nnX2MR5beH9Fu+nXPHbHKMWXCPWEr4ATM9ZSSYXsrzGXYTgDNrzATsFg2YJWe1e2W5Uq4MoFp2kPP3CYqAY6f8fDFvId4bqlM6K9v9mLu++LrnTPORsLVdn6tUvavQM5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708549541; c=relaxed/simple;
	bh=efRf7+25RPEbSTdwUFWDXboYWSyI9tgjpHFvClKXfH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iZlsI4YyKYAfX4Trf1tV7ZWDyYq0vSH//KPnx0XYuRhb0GbpJAGWKQh/mpN+h7BaMHA5if3ooZ5t/QkRE4I69HYox6LtauDoz3Xlwg2pkwhr5cxGWwXQdRRKRp/ttN+cAr3xLcj+uELEb8ZnET2eA7FFMWIPUNNZeDc9qe+PpAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nUP0bRhc; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-7bf7e37dc60so391261039f.3
        for <linux-rtc@vger.kernel.org>; Wed, 21 Feb 2024 13:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708549538; x=1709154338; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ejwz9DMghoUipFK/izgowqt2tzkszOXlq4euAJSl++o=;
        b=nUP0bRhcHSYDnuHmxxOSxQo8Ctnm2gp9nwsBQdSxky1PUUdmgjhEgHIEmtE/2qr4ah
         8tRk7FOMMyQEXEWojc1P6LKrnG/rIO2DyRsnjaCPPt07ilKhVidEqEx75icvndZx9u6y
         iTN8xP2r/rc9OFv/ppuPSkHjGTy4/tWT5/mfJ3WPkb4gLrJA1WQZaitkvfDENSNnYP2b
         +vzZc6+ZB1rulcM6/zv9P2qmHdeg9sEIKe4OVkIJ64FEWocxuN8WO8LB7fzz9yDErshM
         KFi04YThlN8YcVT72hHpUHgtiMyBVF83NO7CDFyC9P1QEEPPHtl/HTJGuQ9SMXxWxXkM
         AfOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708549538; x=1709154338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejwz9DMghoUipFK/izgowqt2tzkszOXlq4euAJSl++o=;
        b=Iejj1IkVMS8fxG7NqRKNF4kpmszg544mCtGzqcCx9Sn+c8kNMrp3flTx8PBK0oBEsW
         oh3mhGnh/RTm0DDVnwyTkwYkcpacRL5fL1s8xGExFq77MILBJqe2uaDVqGHX46xoir9/
         X8JO46en4BQqetqpv8hyZ34hSpbiWVvp3J4QAhvgc1O8AG8MtTpW7zXEODa5etGvrjuP
         vXY3lqG4uXyzD9VuTTmjrUkCU05LV6TpBa/ImIoNNHkXWWesY4xDHLCdiXCmgcXmFs9j
         gF3QULDya3ORdgvsYqa6hj95oB9FZTo6OjiS3xlkugzMiY9ywFQTxeBYt8OmGeVg9+5i
         X7jw==
X-Forwarded-Encrypted: i=1; AJvYcCUJFW7g/NsGvg9nmj+yHeHm/qHk62QLZ4ykD4oZv0UmUAP0QFRaSu8Mhxbc5ffitVXXQcf8ekmONOlk2oHK7zFRnoRWY7ksjdn5
X-Gm-Message-State: AOJu0YzI3pOlE15DCXA3PcbIgyl8VdSipsYMaT/XyRIpLGYUeVY8Szrh
	hOmbNXh+JxLZ5oYY9QbID2IDhKDuwpCYK3Ya1vW3HJO3ZinZWPStFQ/tI/YA+Q==
X-Google-Smtp-Source: AGHT+IF90W1Cze/ZueVDeQCQxFZFa2LEc1oALZbJJ3gj2A8f8YyrfflqUcFHEtIHU8VbMgtFIajcYg==
X-Received: by 2002:a5d:9f41:0:b0:7c4:3ffa:25e9 with SMTP id u1-20020a5d9f41000000b007c43ffa25e9mr20859695iot.1.1708549537828;
        Wed, 21 Feb 2024 13:05:37 -0800 (PST)
Received: from google.com (161.74.123.34.bc.googleusercontent.com. [34.123.74.161])
        by smtp.gmail.com with ESMTPSA id q1-20020a6bf201000000b007c744e62df3sm2177661ioh.34.2024.02.21.13.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 13:05:36 -0800 (PST)
Date: Wed, 21 Feb 2024 21:05:34 +0000
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
Subject: Re: [PATCH 3/9] lib: memcpy_kunit: Fix an invalid format specifier
 in an assertion msg
Message-ID: <20240221210534.eeodh3qxopgp3dhy@google.com>
References: <20240221092728.1281499-1-davidgow@google.com>
 <20240221092728.1281499-4-davidgow@google.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221092728.1281499-4-davidgow@google.com>

Hi,

On Wed, Feb 21, 2024 at 05:27:16PM +0800, David Gow wrote:
> The 'i' passed as an assertion message is a size_t, so should use '%zu',
> not '%d'.
>
> This was found by annotating the _MSG() variants of KUnit's assertions
> to let gcc validate the format strings.
>
> Fixes: bb95ebbe89a7 ("lib: Introduce CONFIG_MEMCPY_KUNIT_TEST")
> Signed-off-by: David Gow <davidgow@google.com>
> ---

Reviewed-by: Justin Stitt <justinstitt@google.com>
>  lib/memcpy_kunit.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/memcpy_kunit.c b/lib/memcpy_kunit.c
> index 440aee705ccc..30e00ef0bf2e 100644
> --- a/lib/memcpy_kunit.c
> +++ b/lib/memcpy_kunit.c
> @@ -32,7 +32,7 @@ struct some_bytes {
>  	BUILD_BUG_ON(sizeof(instance.data) != 32);	\
>  	for (size_t i = 0; i < sizeof(instance.data); i++) {	\
>  		KUNIT_ASSERT_EQ_MSG(test, instance.data[i], v, \
> -			"line %d: '%s' not initialized to 0x%02x @ %d (saw 0x%02x)\n", \
> +			"line %d: '%s' not initialized to 0x%02x @ %zu (saw 0x%02x)\n", \
>  			__LINE__, #instance, v, i, instance.data[i]);	\
>  	}	\
>  } while (0)
> @@ -41,7 +41,7 @@ struct some_bytes {
>  	BUILD_BUG_ON(sizeof(one) != sizeof(two)); \
>  	for (size_t i = 0; i < sizeof(one); i++) {	\
>  		KUNIT_EXPECT_EQ_MSG(test, one.data[i], two.data[i], \
> -			"line %d: %s.data[%d] (0x%02x) != %s.data[%d] (0x%02x)\n", \
> +			"line %d: %s.data[%zu] (0x%02x) != %s.data[%zu] (0x%02x)\n", \
>  			__LINE__, #one, i, one.data[i], #two, i, two.data[i]); \
>  	}	\
>  	kunit_info(test, "ok: " TEST_OP "() " name "\n");	\
> --
> 2.44.0.rc0.258.g7320e95886-goog
>

Thanks
Justin

