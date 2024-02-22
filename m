Return-Path: <linux-rtc+bounces-720-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4A186002B
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Feb 2024 18:57:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB800B2548E
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Feb 2024 17:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8798156990;
	Thu, 22 Feb 2024 17:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="C/GZKSCx"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF349155A4D
	for <linux-rtc@vger.kernel.org>; Thu, 22 Feb 2024 17:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708624642; cv=none; b=Qcy0+hKg7TkmcFaCTzwe9e9pmEzcU/GDv31/hFfpAu90P3rlgFSfm/Z/AWUdccH1pYk4XKC2PYP5owcNtKScecGdJJQ+EwZ4KwETjPWFkgRbzTF9WRGO0LRZvjqawd0gr2h0Q/4IUPd3xS/IOU6E2xIv+sGMmE/hjQiWs8w5R6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708624642; c=relaxed/simple;
	bh=hlPKjlQSc0kMs/W05kmcLVH3IEjiTit6toh7GkaAPKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vE63tDdK2Vgnho4uoyQD+Go0w/n2TKwtoUohuMl8Wu90vE9L7iUg+PpiavEjP5klGgLdWtSFG1MGxEwx54w3qskE7onFIezg9ekk/aT2Hp0XqVjKyfB3k9tt3xNxPwxxG48ovjWMhWa3yXv9g++cd4ACJhk2SKSf2PGWfd6gj6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=C/GZKSCx; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-512e39226efso98447e87.0
        for <linux-rtc@vger.kernel.org>; Thu, 22 Feb 2024 09:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1708624639; x=1709229439; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2n36AeyXiuh8a+bUOx1L+r2cwQosoX8vn/3R6qLfBBs=;
        b=C/GZKSCx9krnzW/91GYSpXCFzd4lSh/fVce4znbLwfR8AxIHeSj99gMXHqiEgt+MYl
         zhUlkyyYyhXJ47/KDPwISDkS/uDO9DYrfAXEN7Yefz03EBkVymKB3ugTh4dKQ2oIbS8P
         BRSLPUJqVNlkHCSOQDeDKklgoNgB2P8ZbIQD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708624639; x=1709229439;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2n36AeyXiuh8a+bUOx1L+r2cwQosoX8vn/3R6qLfBBs=;
        b=jwFcurxAOdNBDznw4dOVTc6vl2kS2RyS1XVs45JgBkuDI+CfcIvufKa90u+HhnZk/m
         AJVcTJ/pA9ZsyUf3TnjE08BC5ULBlNxCRKtDh3u8ouv/H2hqrOsvuXHlnULeg71tc6Rr
         nKzXqJPW34HXbt7N3Lg3ElySRgjtiuvE4CklBf67sTIwDkMuGrwG9pzQZGomekrlkMoG
         TfV/0ZO2iNyl9uvGXHgJNRHOpiAg67E9FQfCx7kkSwm+jneo1/tzbuE7QAwTcpq2JD8C
         QQonWc21kL4qLUI7sVFyHS9kE6M9MrxmNFXezvDH3ZXYpEs5cudyLp4Ttg+nf3vcKWxK
         gPIQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0pL4Lo0JptD5cZCCRkJXGvETjWWgOyKLeKbjexmRAaprRlvjYWB/I6P59DUJjuwM8nU1Kzwwl3p6HfB9IfncOCfjd6D32SB9G
X-Gm-Message-State: AOJu0YzVH3V9PVomiuWI8ODe5VTdBukuN1FppJBT8cFVpiz9d1HQoAPo
	Wc1O4z8Hfyn9teeUuxGwyFwtmM+nqwVKDEZjIU1nP4+mbSfurTgXclfJzpVldiAJ6tDRRLzN2Zt
	jwdtiiA==
X-Google-Smtp-Source: AGHT+IGha16Cc6di+mtfR6tyTBFVi/ki4raMtPUN3Wu7WyE+kZ8lHcSbRLqodvkBRl2/lg5FYmroOg==
X-Received: by 2002:a05:6512:3d9e:b0:512:e0a8:39d8 with SMTP id k30-20020a0565123d9e00b00512e0a839d8mr1469632lfv.43.1708624638781;
        Thu, 22 Feb 2024 09:57:18 -0800 (PST)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id y19-20020a197513000000b0051121bedf76sm2135177lfe.34.2024.02.22.09.57.18
        for <linux-rtc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 09:57:18 -0800 (PST)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-512e39226efso98409e87.0
        for <linux-rtc@vger.kernel.org>; Thu, 22 Feb 2024 09:57:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXgbpeiF7TyPYlB0Ia0Uv3x7QRdZO56ODKSki7qTFvVtYVzlYB/n3DGIb5n1GrILdpFtqXxDXO3gcbIalqlH2nBCYiK1xDfI6Vs
X-Received: by 2002:a05:6512:3089:b0:512:acf1:6970 with SMTP id
 z9-20020a056512308900b00512acf16970mr11555378lfd.35.1708624617484; Thu, 22
 Feb 2024 09:56:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221092728.1281499-1-davidgow@google.com> <20240221092728.1281499-3-davidgow@google.com>
 <20240221201008.ez5tu7xvkedtln3o@google.com> <CABVgOSn+VxTb5TOmZd82HN04j_ZG9J2G-AoJmdxWG8QDh9xGxg@mail.gmail.com>
 <CAGS_qxoW0v0eM646zLu=SWL1O5UUp5k08SZsQO51gCDx_LnhcQ@mail.gmail.com>
In-Reply-To: <CAGS_qxoW0v0eM646zLu=SWL1O5UUp5k08SZsQO51gCDx_LnhcQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 22 Feb 2024 09:56:40 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiODww51Kz-TTWn0ka5T8oMtt0AfbO9t0U3iJqfLZO+8w@mail.gmail.com>
Message-ID: <CAHk-=wiODww51Kz-TTWn0ka5T8oMtt0AfbO9t0U3iJqfLZO+8w@mail.gmail.com>
Subject: Re: [PATCH 2/9] lib/cmdline: Fix an invalid format specifier in an
 assertion msg
To: Daniel Latypov <dlatypov@google.com>
Cc: David Gow <davidgow@google.com>, Justin Stitt <justinstitt@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rae Moar <rmoar@google.com>, Matthew Auld <matthew.auld@intel.com>, 
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

On Thu, 22 Feb 2024 at 09:36, Daniel Latypov <dlatypov@google.com> wrote:
>
> Copying the line for context, it's about `p-r` where
>   p = memchr_inv(&r[1], 0, sizeof(r) - sizeof(r[0]));
> `p-r` should never be negative unless something has gone horribly
> horribly wrong.

Sure it would - if 'p' is NULL.

Of course, then a negative value wouldn't be helpful either, and in
this case that's what the EXPECT_PTR_EQ checking is testing in the
first place, so it's a non-issue.

IOW, in practice clearly the sign should simply not matter here.

I do think that the default case for pointer differences should be
that they are signed, because they *can* be.

Just because of that "default case", unless there's some actual reason
to use '%tu', I think '%td' should be seen as the normal case to use.

That said, just as a quick aside: be careful with pointer differences
in the kernel.

For this particular case, when we're talking about just 'char *', it's
not a big deal, but we've had code where people didn't think about
what it means to do a pointer difference in C, and how it can be often
unnecessarily expensive due to the implied "divide by the size of the
pointed object".

Sometimes it's actually worth writing the code in ways that avoids
pointer differences entirely (which might involve passing around
indexes instead of pointers).

                 Linus

