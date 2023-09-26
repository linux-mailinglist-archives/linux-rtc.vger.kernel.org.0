Return-Path: <linux-rtc+bounces-21-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2437AEAE2
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Sep 2023 12:57:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 9D05E281A65
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Sep 2023 10:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0B4A26295;
	Tue, 26 Sep 2023 10:57:03 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F10812B72
	for <linux-rtc@vger.kernel.org>; Tue, 26 Sep 2023 10:57:02 +0000 (UTC)
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0593195
	for <linux-rtc@vger.kernel.org>; Tue, 26 Sep 2023 03:57:01 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-59f1dff5298so93573917b3.3
        for <linux-rtc@vger.kernel.org>; Tue, 26 Sep 2023 03:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695725820; x=1696330620; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+yFxl6n4mvRXw7jluKkJGV+bmvyn5qTXRpdajEZLGg8=;
        b=ChpI1j8sxmf3KQOBXD0J/wN7MflfWR2g0xK6B/hPIEeKvHLqJu6IpdYZbeh1eToyfH
         Mxnd0WD6P79z2PHpzxqsQqmnTbqGE4NGE7LjKAut+Y+Ox9dfachUaXu6zCRacjLfI/o0
         2snFDAPdrq2R+eFCBnPLTo3ETVfBDGagLWhVbbq53x2AcVwa1+/n2SUDZwRZAMjGpTJM
         NXiV54cXYxVcrrXwLVnbnjvCNI3yZK9UhOpKEBeKffHHE0OgjJFxWz3gAJ+oVlksOjpj
         GggF6+skpynBWkcxgwg/wo46dAFNkTWHvZka14eah4Foy1HP2Je1n+JIw/vi+JO6m3jq
         4g6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695725820; x=1696330620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+yFxl6n4mvRXw7jluKkJGV+bmvyn5qTXRpdajEZLGg8=;
        b=LU71dMhhsjAtVHYqyaUhwjNU/8/Io1a1MeuTPVk/oThRhX8eU4OA2hxgzQtRgpGbac
         XyeR6jmn+tz19JyOGiQvG+DJQYJb3AC2eRxY1Tk/r01xYIQdTikAjOG2KeMuPOGUoKaP
         zHRK7kFxYXwxXbq4XeIrze6/h0Uqq3YexoKqepsAEn0UPa1Q+6JMYCc4Uh2OwXZPDYf5
         DtQdeDN3FutALgNV5ODE9EvaScIKlC+abtlhn9QPMGQPuuwy0/2OlX5GtnV+EGOn9KWd
         cIeLCTIV8BTTY5Gh+MAeIT/WHgoE0mHTFFNuD1TgHWj5zrUDZPlndHxGLTBF4Ou3+5Q1
         OtXA==
X-Gm-Message-State: AOJu0YyI876YJoZrjnVzl/xynnr+goLeVCTPj1FrH7wlzZC0Pqh9r1mw
	E+bfqLe2PPFy+yRKg9v0e3yubyQSO3Ifw82ZR45xZQ==
X-Google-Smtp-Source: AGHT+IFYMo6vNxLPVaePYEv+Q9UttG4JjxZ7q/TJyEIAvX2UEziDYG32Tt5Dn4ASPYNegMxnHVJlZ6Q0FGbEuRMKJ6Y=
X-Received: by 2002:a81:4f8a:0:b0:578:5e60:dcc9 with SMTP id
 d132-20020a814f8a000000b005785e60dcc9mr9287945ywb.10.1695725820227; Tue, 26
 Sep 2023 03:57:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230921-rtc-7301-regwidth-v1-0-1900556181bf@linaro.org>
 <20230921-rtc-7301-regwidth-v1-1-1900556181bf@linaro.org> <20230922-magenta-impending-f5ade19286ae@spud>
In-Reply-To: <20230922-magenta-impending-f5ade19286ae@spud>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 26 Sep 2023 12:56:48 +0200
Message-ID: <CACRpkdZaGJQp8965YQDspjpSMRCVDYD1eyCb+dhg3SEtRS4a_A@mail.gmail.com>
Subject: Re: [PATCH 1/2] rtc: rtc7301: Rewrite bindings in schema
To: Conor Dooley <conor@kernel.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Akinobu Mita <akinobu.mita@gmail.com>, Jose Vasconcellos <jvasco@verizon.net>, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Fri, Sep 22, 2023 at 12:45=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
> On Thu, Sep 21, 2023 at 10:27:42PM +0200, Linus Walleij wrote:

> > This rewrites the Epson RTC7301 bindings to use YAML schema,
> > and adds a property for "reg-io-width" as used in several
> > other bindings to account for different register strides.
>
> It'd probably be good to mention that there is hardware that needs this,
> rather that saying "other bindings use this".

That is an explanation why I call it "reg-io-width", rather than,
say "reg-stride-bytes" as there are other bindings that use this

But I'll mention some hardware, no problem!

Yours,
Linus Walleij

