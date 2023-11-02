Return-Path: <linux-rtc+bounces-184-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8991F7DF743
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Nov 2023 17:00:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4281B2802A9
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Nov 2023 16:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE3861D556;
	Thu,  2 Nov 2023 16:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KlX0QeGi"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73AF1CF86
	for <linux-rtc@vger.kernel.org>; Thu,  2 Nov 2023 16:00:46 +0000 (UTC)
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23B7518E;
	Thu,  2 Nov 2023 09:00:41 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7789577b53fso60028085a.3;
        Thu, 02 Nov 2023 09:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698940840; x=1699545640; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pz4xtVbF475+Pz9FkJzwn0CJZFwJfa9rLwbb0l0oHbA=;
        b=KlX0QeGitfYK/azBpcMoE6CtZPZxW1xq1eWT1RS7GRVfKBO9/xoSvYPHqnLsB/jdTY
         3fkhrIZny9I3FLMBVJziqSEp9WFJssuwm1BWUpqYgOGDbUcpb0nN4pYQICcB0cxOGCH9
         PCszp7WFpLxWKDL6FrHnSlC/OOoi5jXULnTpZga9wBUH8UGoZbyl1Br1VwBcl+bGPDK9
         3hIIlubLn0uJLlC80F4MMllJEzjJOwOxOKTbEVRR7Wv2S/K6ryl9mi411qVVYjvnBBOr
         B56QYKBEYZiVHL+9jHD5feIz1lhaiuicYXK5nJFzYPkCuNi0vDAKk79iGcTac3/3Rb1O
         0rHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698940840; x=1699545640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pz4xtVbF475+Pz9FkJzwn0CJZFwJfa9rLwbb0l0oHbA=;
        b=HtRcEHucGJr15hRaOGuMKGpE0cOoD9+n+66iMt2PpBdAfGQ6Qv6YdjJQHHnuOobX1f
         PiZQAp7U4/p2GwHylITC+O/3CJIkwWDlMzEcoRI1mIVOFefXJiAQ5HX3JvZNrXXxWIMw
         oErFVe3D2kLZeU/lhEEhNiUN6mpERyE2I3gQNAj1uFNDTZeYrjlRTU55yiXDdYAK8pP2
         joHaX+NK90JiCk8gvtOcXSynQPX11o6viDYwwsYNFjjQpxNMxGg7iv8phdkGlCtnTMTR
         5Mks5DLTmbpJXRm5Z/EqZA5tGl2WviWPvFeqXvumCvTd0T9M8pYV5pGeFFo7J+/Dzcvo
         9MZQ==
X-Gm-Message-State: AOJu0YyKADnP2IW9GpNLUOJBoRc6MHLekXLRYL7NN6GQvR8g/wNFSiW4
	K0NZQJ337bFTtftbvUaSdoaHVJgCG1fv9ZxU6r8=
X-Google-Smtp-Source: AGHT+IFJOo7yoHIY4QN2C9zC5oQ8llybZSNIBa763mqL1PmRjeFGcyV57n8FUP79bxgLosjpaSyzMXpfn3/LSsAeMMc=
X-Received: by 2002:a0c:f446:0:b0:66d:2b0a:bf0f with SMTP id
 h6-20020a0cf446000000b0066d2b0abf0fmr17334703qvm.46.1698940840183; Thu, 02
 Nov 2023 09:00:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231102132616.1130960-1-eblanc@baylibre.com>
In-Reply-To: <20231102132616.1130960-1-eblanc@baylibre.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 2 Nov 2023 18:00:04 +0200
Message-ID: <CAHp75VdvR0H7XVLWGqdZqSgoHprUUPQHGiyWEEaHjTgEbeinqQ@mail.gmail.com>
Subject: Re: [PATCH v8] rtc: tps6594: Add driver for TPS6594 RTC
To: Esteban Blanc <eblanc@baylibre.com>
Cc: a.zummo@towertech.it, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, jpanis@baylibre.com, 
	jneanne@baylibre.com, u-kumar1@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 2, 2023 at 3:26=E2=80=AFPM Esteban Blanc <eblanc@baylibre.com> =
wrote:

> Notes:
>     This patch was picked from a series since there is no dependency betw=
een
>     the two patches.

Not sure if RTC maintainer uses the b4 tool, but as I said in previous
email for pinctrl change, there is no need to resend. b4 has an
ability to select patches from the series to be applied.

--=20
With Best Regards,
Andy Shevchenko

