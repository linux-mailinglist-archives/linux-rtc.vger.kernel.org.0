Return-Path: <linux-rtc+bounces-185-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E729F7DF77E
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Nov 2023 17:17:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7705FB21042
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Nov 2023 16:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C5F1DA22;
	Thu,  2 Nov 2023 16:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="otdArOjv"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E041CF86
	for <linux-rtc@vger.kernel.org>; Thu,  2 Nov 2023 16:17:26 +0000 (UTC)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7AD212E
	for <linux-rtc@vger.kernel.org>; Thu,  2 Nov 2023 09:17:23 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-53ed4688b9fso1876353a12.0
        for <linux-rtc@vger.kernel.org>; Thu, 02 Nov 2023 09:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698941842; x=1699546642; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PcTsZNfH8uzMszz0/Isw0cv0s2mphvKpQCC7w0T8ytw=;
        b=otdArOjvbDaZKoyqwx/hcM6m8Hh3K6iOLKCtN+GQhLhB0/nxAXccCNBJvy6BXvmJDM
         0DkbNCSYO1RaKOShRhycnrgMv2PJ8AUUrD0OgQ79+c1rzXkIwsbzpNOdVXPAXTOeVddG
         UN6KT7YIWvd2wRFlGQS1Uk1r7w5FA93Tw1Ardc7+8k23RHoweiUMMW7GFNNc05bd/X5j
         U/dXEjyqb5YK+ivGm69knkxPeBpr1Ze3w6rS/5o1+dJ1FGG8oUUm/KUC3N+y+IdY2yMT
         9X8pYDZhU2EPooYjZUgemmUjteMgjIu8we2/b1nwF+LdBJY1yWQnjKKvNKXmVU3gM3FN
         LnwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698941842; x=1699546642;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PcTsZNfH8uzMszz0/Isw0cv0s2mphvKpQCC7w0T8ytw=;
        b=anMRfhoWg4nyH2BbusmcCg7J1RiUvkwuQZLp52lCgAjUcPGkcf0vRV8q4P139rNAZ9
         642hmg21ltQds7h+HmZRwpjcuJfBl49bVOgOnT8NIpcPZGHVMjAzGVAIZI0RZz8m0hou
         DP2YGHsp+uiUgO3dK/+a0P38nuJTWQlvdGWf1Nu33LQsss/bYEUWatO6HwbnMFKZrcaP
         lcpFNlilhdHLOONFmtZP4otxgCLcUxWPuBgJCO3vngkYENiP+WrqZVMb8+k+X4fTXIcE
         zLKv8CanFCMsPjPF070fzjCL9xPOXT7YLeBYk8pLm8A2ZKqbPlsKRFVkvlY3QRumNWrR
         T3UA==
X-Gm-Message-State: AOJu0YzvZ5EYHTB/u5K8yUDPQrUtaXpESPFIofhsk6gpDwWL9oXJ7HWQ
	6/YjPKe+7ZunCC4nw3B6MjQCPA==
X-Google-Smtp-Source: AGHT+IHdrz4vMAH2qUJu1kwrlt/8tMoVWJZq1nPfpGgOHFt7yVrmQQe4qPXrPH6Wb7NkVdYDUCFrzA==
X-Received: by 2002:a50:9fe2:0:b0:542:da34:cb7c with SMTP id c89-20020a509fe2000000b00542da34cb7cmr12171037edf.19.1698941842188;
        Thu, 02 Nov 2023 09:17:22 -0700 (PDT)
Received: from localhost ([2a01:e0a:448:76e0:588c:af9c:bddc:7245])
        by smtp.gmail.com with ESMTPSA id a5-20020a509e85000000b0053e3d8f1d9fsm45300edf.67.2023.11.02.09.17.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Nov 2023 09:17:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Nov 2023 17:17:20 +0100
Message-Id: <CWOGMAUT9MKY.2IBKELIOR1CF7@burritosblues>
To: "Andy Shevchenko" <andy.shevchenko@gmail.com>
Cc: <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
 <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <jpanis@baylibre.com>, <jneanne@baylibre.com>, <u-kumar1@ti.com>
Subject: Re: [PATCH v8] rtc: tps6594: Add driver for TPS6594 RTC
From: "Esteban Blanc" <eblanc@baylibre.com>
X-Mailer: aerc 0.14.0
References: <20231102132616.1130960-1-eblanc@baylibre.com>
 <CAHp75VdvR0H7XVLWGqdZqSgoHprUUPQHGiyWEEaHjTgEbeinqQ@mail.gmail.com>
In-Reply-To: <CAHp75VdvR0H7XVLWGqdZqSgoHprUUPQHGiyWEEaHjTgEbeinqQ@mail.gmail.com>

On Thu Nov 2, 2023 at 5:00 PM CET, Andy Shevchenko wrote:
> On Thu, Nov 2, 2023 at 3:26=E2=80=AFPM Esteban Blanc <eblanc@baylibre.com=
> wrote:
>
> > Notes:
> >     This patch was picked from a series since there is no dependency be=
tween
> >     the two patches.
>
> Not sure if RTC maintainer uses the b4 tool, but as I said in previous
> email for pinctrl change, there is no need to resend. b4 has an
> ability to select patches from the series to be applied.

Oh that's good to know, I was not aware of that.
I resent it because there was some minor nits that I fixed on both
patches.

Thanks for your time Andy,

--
Esteban Blanc
BayLibre

