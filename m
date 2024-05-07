Return-Path: <linux-rtc+bounces-1121-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF02D8BEAD9
	for <lists+linux-rtc@lfdr.de>; Tue,  7 May 2024 19:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F01A21C23FE6
	for <lists+linux-rtc@lfdr.de>; Tue,  7 May 2024 17:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D723316C87A;
	Tue,  7 May 2024 17:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R5pdE+Oj"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B4B16C863
	for <linux-rtc@vger.kernel.org>; Tue,  7 May 2024 17:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715104439; cv=none; b=q91JQy2N9/jHdV+uCIwun7kH3Of8ZUTyb/1QtqPVRYSJexk4CW8SG43PEtmbpyOJdYbiUFAdaZ8TT7OTEHpXM5ETghSq/vUaK0pDyudKmU8DE/pUNq1xIFeGYQouu4dN6xfwVDUIXTIU5pG2oxf0jhwE0/Qw+uHYQgn/mrttVpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715104439; c=relaxed/simple;
	bh=f4jkcb6eCGK9z9a2d3qPQI3YlfWTfGaPefAR0W1j3LQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LPAgziLeve0cIUQDFmnIomgz4svcV3JP40FkEXZ5BW0Wz98c0Wse5WIbTFmLPpcOokNCI/9x7ID9y4lJN3z341YhKdb/e+BDraB1x24S92+v+X4+ZFWJhw7QO9bdkbxgIN3hYXLFnC7ICN/ZAUhDAbpqTHN+qnjVHAO8y0yvVw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R5pdE+Oj; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-41a428374b9so11115e9.1
        for <linux-rtc@vger.kernel.org>; Tue, 07 May 2024 10:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715104436; x=1715709236; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZSBxoniVFCnSwsRyNGGB/5WVFKEVwOzPElRSvx/1EU=;
        b=R5pdE+Ojdt2Cf5snoCts3zjuPF+NBboucpKaRWvWgyataQj2lyuCl8muFmDUew1dIJ
         pDT0/AfQStpl9KL5fIHOuhGp/GFnj/lvtdIgkxXj0TeJyfYCJsmg5l0+Nx+iRcwvEK2K
         +T6bgg/8EupoWfWeKz4F5PGwEWZJF4OgUdYAptkWRbt9z2bCz7HQwYNdNLQW+vO7DY7R
         1Otjr7MtGzNjSh1KPtRe1WvnwHFWbbZhX/C+UnSGdcFMNNX1gox1bnmmu0UY9B8fWjhB
         gN01Ma6l8bRH9yRsacL7Pq/XGNZPAciiYzX4QcNJNRYeOr5H6ak9cuiYu73daIk4JlMb
         PXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715104436; x=1715709236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZZSBxoniVFCnSwsRyNGGB/5WVFKEVwOzPElRSvx/1EU=;
        b=cfuuY3mgAHXok3nTDeZfzn7QYPu4Pk5sOYwTeNKqRUrnx+4BreQnS6lWWrmkAuzyk7
         A/oq2ERbzHRlW7mjfTIJOaTfM7s/SDyKlin/GtaO+w+Oa1Rx36b8v9LX2oGLskMhh/OX
         FIjPxNwqoLY/5IVKU7J3KXOMccQ4sgVFLt+YFqGqZyzBg6ddB+qEud/Z4NZTDOyGDpq8
         Cv7pggsC1k2o8UrRv2cBaL2JCBLKqDhQhprM7Ue/5bR2K73DWJKh0piXspt9SbP92hRF
         +wZyqQdy7yHvyGFIiqcONx17JhYBoValTqSwt4VWSlqw94epRggonV9tU25LM7e+Ub9T
         U5zQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBMSy7GKkW5GeOMuEMtsqeAlfw+gWLZNPVc3I9fvCtWgvUkSRysGddPGN5h673nR3vogF50DZr7TztwPFoOX1awmkh7AUbc73o
X-Gm-Message-State: AOJu0Ywe6JKuNx7CyACRJKk8UE9W2MOdjRCKG0He/EPqrV5FFdDh+IRq
	emwKMiAt2ZAvriiDJsf9LPyKV/NIZ9p4p9v+hUUhnqYK6vgaPOcokE/GxDAkogIgpUH4QXQnTXC
	DlLx/YL1do2JpRGbn8Zfw1N/iloFTQuj2xKsp
X-Google-Smtp-Source: AGHT+IGz1XnPd5AWeO8uJ/y11xaVSFsWnWF3iUnew2fdVCadE6k0qGy9DNTjKr8tWwxbE8CeHiLNiXoVqCbHcy7HxH0=
X-Received: by 2002:a7b:c046:0:b0:419:b16:9c14 with SMTP id
 5b1f17b1804b1-41f7a8634ffmr90295e9.1.1715104436438; Tue, 07 May 2024 10:53:56
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240430235057.1351993-1-edliaw@google.com> <ZjGiGq-_kUVht63m@finisterre.sirena.org.uk>
 <be921714-b684-401e-a89a-8256df5fcb86@collabora.com>
In-Reply-To: <be921714-b684-401e-a89a-8256df5fcb86@collabora.com>
From: Edward Liaw <edliaw@google.com>
Date: Tue, 7 May 2024 10:53:28 -0700
Message-ID: <CAG4es9V1SYe-JA3xfkwqchZ37Oc3PY6O36hGcA26-JHZ2MmSCQ@mail.gmail.com>
Subject: Re: [PATCH v1 00/10] Define _GNU_SOURCE for sources using
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, shuah@kernel.org, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Bongsu Jeon <bongsu.jeon@samsung.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-sound@vger.kernel.org, 
	linux-input@vger.kernel.org, kvm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-sgx@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2024 at 10:41=E2=80=AFPM Muhammad Usama Anjum
<usama.anjum@collabora.com> wrote:
>
> Thanks for the fixes.
>
> On 5/1/24 6:59 AM, Mark Brown wrote:
> > On Tue, Apr 30, 2024 at 11:50:09PM +0000, Edward Liaw wrote:
> >> 809216233555 ("selftests/harness: remove use of LINE_MAX") introduced
> >> asprintf into kselftest_harness.h, which is a GNU extension and needs
> >> _GNU_SOURCE to either be defined prior to including headers or with th=
e
> >> -D_GNU_SOURCE flag passed to the compiler.
> >
> > This seems like something that should be handled centrally rather than
> > having to go round and audit the users every time some update is made.
> The easiest way I could think of is to add -D_GNU_SOURCE to KHDR_HEADERS
> definition in tools/testing/selftests/Makefile. It wouldn't be obvious fr=
om
> KHDR_HEADERS name that there could be other flags in it as well though.

I'll try this approach and see.  It looks like there are also some
Makefiles that don't currently include KHDR_INCLUDES.

Also, this will cause _GNU_SOURCE redefined warnings wherever #define
_GNU_SOURCE is present.  Should I also delete them or wrap them with
#ifndef?

>
>
> --
> BR,
> Muhammad Usama Anjum

