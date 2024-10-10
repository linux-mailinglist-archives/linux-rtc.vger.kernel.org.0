Return-Path: <linux-rtc+bounces-2145-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1CB998300
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 11:58:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B0EE1C2101E
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 09:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 146821BDA99;
	Thu, 10 Oct 2024 09:58:22 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5034119E7D0;
	Thu, 10 Oct 2024 09:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728554302; cv=none; b=k+DwBGOsgfUu8yAaWWUKX05vNaTk7N8nPj+ZvhhEmpD8KVa/rmPz9uo+ixPOkYcTbpMPCzsrxZQMP24SBHqHLK9cTqQ4fHEQc+CB0PWdeUQ/t9VVlZldPOAgBBeciEvC8d0NdUehE6zWt634CBzmIV358JAa0ibHhlwEvUFxqBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728554302; c=relaxed/simple;
	bh=M/N4iyycHpjsNiBum0ltR+3tV9x06dWoQS7Pi+SV1cI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=md8wiIRxvQxk9Yxo21kAIKaPaiLvSWgQ5Fztgq77yon8mN6hsomG0lBx+FPH/fCBLE8alsvHlIISz9Hpde5eoYV4vsK94mQjDItHecZKfcnyGP/8yiG1Ods5RUuTapDccx2SL0hihOqwndgirXC2hRNdkSiPoDXCTEsaJn/vNSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e29072f194aso627294276.3;
        Thu, 10 Oct 2024 02:58:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728554297; x=1729159097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gyYDEMJQN0e3qrTRJi0lW82aU2fQXGEhYCzwe7aKnDM=;
        b=IFaqdgLLqIkCxSt+DINZKwSI7dwTKb9rTKzR3idm8ncUrUqPAqHwiUklPduLRn3wqm
         kjaFdbwk2rcQyZTwM0XfQyohz6NNaT4gSsEeZuZxRRyd6dnq6KxO8qlnEMhDJppttV6t
         6P1wwcDaeVw1rBBVjS2+/k9IvVKFM/8ZnMzfXjJsL7pvvkzv13NvFhcAXYoKc+SRAy3i
         wAJhZ+W/I120v7vec/P31auCDRpViVux/6h8prYN2Zn53bLPd4Rhcu0sh343le1QRnRC
         55S5yM2eNBgYC7HuHCFx/X3QSgVZrlyjT9A5vF4nDlT/iXDSpxkJhgpGET2mVn5tJFns
         OHmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUevWHW3ZD9cFAH2ZlpFukR5x9hGso2A8qhr7+G7wUB45JE0aXQALww5fMEGMoZR4J06w+IJDeSoFjO@vger.kernel.org, AJvYcCV7vXoEHEQDvrsfk/dUSqAJ/1tbkYZtfakkC5gvT9O7XxDbUkssGk2h4C5CragWWLCW9n00WcszxW8n@vger.kernel.org, AJvYcCVC0R6CMoxi4gaCeFM/qhz3V5DZuWHVIHRmwDFeDpNw9cubcLXAqnwhgMHRdoE7wUATnxzOCw65pCWLdH9B@vger.kernel.org, AJvYcCWLXJ76BaYfvTKPJA21XMQQ9+PgNx4SuRYLy6tF77S7W8NCSDWr4WApW9tmr8/x/kfTRt7EuPIeCQ/9oZSwRu+YLOo=@vger.kernel.org, AJvYcCWrtUGr9H4IKFuCPpwy+uM63N6riUx+fS5/d6r98NfEp5xunCv57nbUDORqQNh0a2I4iRPwjR3UPjLz@vger.kernel.org
X-Gm-Message-State: AOJu0YxYbfLzYmknXxOro2JmXJ1wmDyBN9bMX6ATRMtfmupnm1sn7szs
	XMo0Tlo9TfpOAJS3t1UBvC9sqBG3GAejT91aN850aR7jG4yFaKiS/8904eIs
X-Google-Smtp-Source: AGHT+IG/xzzoi6LYDUCzQ6zcX0arl82Xw+kQv6kMtHvywM3Jq2N1SPXsKTJFs/8rb/F5tkH8ygWKOw==
X-Received: by 2002:a05:6902:228e:b0:e29:c32:431d with SMTP id 3f1490d57ef6-e290c324a77mr2465754276.11.1728554297512;
        Thu, 10 Oct 2024 02:58:17 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e290ef8c89dsm229342276.64.2024.10.10.02.58.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 02:58:16 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6dbc9a60480so7443147b3.0;
        Thu, 10 Oct 2024 02:58:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV5Nr9zAbzdSEincYdLycawyY4UvR1cWLh7TVkZ0xWdyJtaAGH3q9/9GxyZDpgWw01+O82ZhuWzXi2o@vger.kernel.org, AJvYcCVFPTJG124SUhmya6f7TguSGZOpYK9mPwbQlt9H5wpgWQQV3L3wwooyag6SwIX3HcdrTsqfEinHOstd@vger.kernel.org, AJvYcCVNTVJKa4j7412xPIldQniOb/P77e/d/K/JoVuI4s37fGA5fSq9/sCqG9WKzkJtOrPu0Vs4o8lLqIQx@vger.kernel.org, AJvYcCX4AMoc4XkJiAUgOw/+yPCkK4Csm6fNUz/aUApL7MibMO8MqBn6wENUncrKws8leP5slAmA7jsTobcxsI9o@vger.kernel.org, AJvYcCXYlCDfsbMciYSXaE5gpwm9TVQ5EiYzhRu1wF/wWxbVF6DYtmbgXw0TH8smuLowP8B3WIS0pH5PXLF3j9QT2XJ7Ntg=@vger.kernel.org
X-Received: by 2002:a05:690c:6206:b0:6db:bfa1:5530 with SMTP id
 00721157ae682-6e322491433mr59403057b3.41.1728554296092; Thu, 10 Oct 2024
 02:58:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com> <20240830130218.3377060-2-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240830130218.3377060-2-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Oct 2024 11:58:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWGLPjjAbUG-RtgwYLrN+eaFD0SGoLTsrjTJokxNd_=CQ@mail.gmail.com>
Message-ID: <CAMuHMdWGLPjjAbUG-RtgwYLrN+eaFD0SGoLTsrjTJokxNd_=CQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/12] dt-bindings: clock: renesas,r9a08g045-vbattb:
 Document VBATTB
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alexandre.belloni@bootlin.com, 
	magnus.damm@gmail.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Fri, Aug 30, 2024 at 3:02=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The VBATTB IP of the Renesas RZ/G3S SoC controls the clock for RTC,
> the tamper detector and a small general usage memory of 128B. Add
> documentation for it.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v3:
> - moved the file to clock dt bindings directory as it is the
>   only functionality supported at the moment; the other functionalities
>   (tamper detector, SRAM) are offered though register spreaded
>   though the address space of the VBATTB IP and not actually
>   individual devices; the other functionalities are not
>   planned to be supported soon and if they will be I think they
>   fit better on auxiliary bus than MFD
> - dropped interrupt names as requested in the review process
> - dropped the inner node for clock controller
> - added #clock-cells
> - added rtx clock
> - updated description for renesas,vbattb-load-nanofarads
> - included dt-bindings/interrupt-controller/irq.h in examples section

Thanks for the update!

LGTM, modulo issues pointed out in other review comments.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

