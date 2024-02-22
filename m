Return-Path: <linux-rtc+bounces-721-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89177860439
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Feb 2024 21:59:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 273141F24956
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Feb 2024 20:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41ACA73F05;
	Thu, 22 Feb 2024 20:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MOHJAqqc"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836316E601
	for <linux-rtc@vger.kernel.org>; Thu, 22 Feb 2024 20:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708635549; cv=none; b=HR7JgQz7AIWop81M6EIQQlsU+ZFbbEkFnfjKdgXgylfqbWJBr4WDt8qnhaSQp8f5SDv5y5qh0k1YzCdjnUaSWZoeSOAJTR6S7OS9Spd4qLPdcMWNjq2zPjkTgA4pnZRsMR3yC8qyM4jX7VwfZETQkz0cfEMxXgUNCKpO7g0lzzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708635549; c=relaxed/simple;
	bh=C4F7mlB1MqkcQcSyoJUPRfFHjf+dal0cew/+pSwHCXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G/7w5mP3socPkXCcNQIj64kW36pZQZTvBXFOYnOqBwyxd70ZT33Zn6/CvUDFyPDTY8Z5rXIoDyCARy/KqtMR+TvrZCDomkGr6XvZF4Sc1K8xJY/JLnG98KKUt/CXoBfyEX/xYbNDaVNTJO63GvPlYhZxou04P7YMmpOFcq4BfOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MOHJAqqc; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-42e2507c6e1so82271cf.1
        for <linux-rtc@vger.kernel.org>; Thu, 22 Feb 2024 12:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708635546; x=1709240346; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/zEWuRWWHcJcQcinmF9Ig0PacXm/lMdwIIHptRGDzpU=;
        b=MOHJAqqcAnRE2NSLZhyESs/g5WAAwqx5bZyPaxifPADGalK3WQEz1I3/0pCW5PdqkI
         ppGl1SyQhYFGzNy3SRnVVLTY8Q1L8ClG3FqEJkJFXqganGsY65/lTMo5K9QmgtbfBQBT
         /MeX8JzP/yxOS/GN9tRwdo5b9tqFO67Q3SN5n3ZFQmGAOoKwdOojExjprnKpJnkBuAye
         J/xcM0eZbNV01MeMB6Zn38/zOZ0fXEcY92HQMr85IBGcDe7q1sFoYO+RTn8ebga0c6zy
         PEdTG+3lch6bIe0ZKqq+1kwFgOLk1lc9vRg49EcN0d0xSJgE9xzi9uGljq5REEQ/s7/E
         Vqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708635546; x=1709240346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/zEWuRWWHcJcQcinmF9Ig0PacXm/lMdwIIHptRGDzpU=;
        b=uKNhbUcof3SFQ2Cm83hINKPNw+BFSUdftlPMgWfqcdttlBvcsMLpAVrucdBzyZN+Eo
         Ul9vJ4RJoQLF37EXPpQHCXxwFgt7FAxbxnhOn/8JF960+L6xmi9hRaEpzUnRbIzDwcci
         UAQAi+Uql4w8nvSXYT7Wmd8T35wlHOdOv5+jjQYY2pnCDZShN4FamlqWlAhuavVJL29S
         JYkbhPqZWDDWuo5FF75vRAkzKfZoYBVF9WHROaQtwqbyBllOrp9exlSMgU+XO1gtyvm4
         /zYVoAgtYr0wJ9cHLDIVEtR3vQbtajvYYeL/GSc+EgcUuhcwwPCD1tRD89QuMrCD/8Ug
         tnEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnCHWFbS1sSCB6pyI02qHsu0742K2fNntTqs7g3zSPBglAtg87qV304iOPikDaw4afEtj6oxsuJ/1fZBhqzJ0gtvAqmWTwOBYO
X-Gm-Message-State: AOJu0YxT6caCBKzFeZ2NuXw2PYC2rW/fSkeypXBRMmIRTqenX2d18p/P
	7hpKD5Kt+sR97R5zt+7I254rtryonaam/cSk3JZxsbqm+rD+WYiViR8FIf3agyI+CMys8vWgOJd
	Wavr3G8b5giH9fGibQw+oZ3DsyjQgwZ1D9klf
X-Google-Smtp-Source: AGHT+IFSpfaLdIKihK3iEVOja+3Eqku3dKQtV6o3yrUl8zcXbBHUkfm22S3h1VkUJApYDgRUGbJE0TXcXoTj3FcGfX4=
X-Received: by 2002:ac8:7643:0:b0:42e:1260:c4e6 with SMTP id
 i3-20020ac87643000000b0042e1260c4e6mr732606qtr.10.1708635546371; Thu, 22 Feb
 2024 12:59:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221092728.1281499-1-davidgow@google.com> <20240221092728.1281499-2-davidgow@google.com>
In-Reply-To: <20240221092728.1281499-2-davidgow@google.com>
From: Rae Moar <rmoar@google.com>
Date: Thu, 22 Feb 2024 15:58:54 -0500
Message-ID: <CA+GJov6GyU0t0D5quhroCgEQOJgk0PCjVn5LROifBcNMx-ovcQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] kunit: test: Log the correct filter string in executor_test
To: David Gow <davidgow@google.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Guenter Roeck <linux@roeck-us.net>, Matthew Auld <matthew.auld@intel.com>, 
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
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 4:28=E2=80=AFAM David Gow <davidgow@google.com> wro=
te:
>
> KUnit's executor_test logs the filter string in KUNIT_ASSERT_EQ_MSG(),
> but passed a random character from the filter, rather than the whole
> string.
>
> This was found by annotating KUNIT_ASSERT_EQ_MSG() to let gcc validate
> the format string.
>
> Fixes: 76066f93f1df ("kunit: add tests for filtering attributes")
> Signed-off-by: David Gow <davidgow@google.com>

Hello!

This change looks good to me. Thanks for fixing this mistake.

Thanks!
-Rae

Reviewed-by: Rae Moar <rmoar@google.com>

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
>         }
>
>         KUNIT_EXPECT_STREQ(test, kunit_attr_filter_name(parsed_filters[0]=
), "speed");
> --
> 2.44.0.rc0.258.g7320e95886-goog
>

