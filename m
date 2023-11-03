Return-Path: <linux-rtc+bounces-193-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC837DFFD9
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Nov 2023 09:55:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E33C21C20A08
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Nov 2023 08:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9086F8826;
	Fri,  3 Nov 2023 08:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="MM6PDCGI"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D8723DD
	for <linux-rtc@vger.kernel.org>; Fri,  3 Nov 2023 08:55:20 +0000 (UTC)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B14E6D43
	for <linux-rtc@vger.kernel.org>; Fri,  3 Nov 2023 01:55:18 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c509d5ab43so25930251fa.0
        for <linux-rtc@vger.kernel.org>; Fri, 03 Nov 2023 01:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1699001717; x=1699606517; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KieNi2VRLuqIWbngtceJ+14hQSrE87wAqVWYboYUpn4=;
        b=MM6PDCGIOiwVSjUGZzDlbDYpc2sZ1lpMF9ddFCUhOZAx+fBKY9pekPj3/jQZ3BlpuR
         dcyxwPOr0f9vmHZZS3DZQoTy6671jY0FHawn2h9qkDj/H+UwuSd4+NP5KoK/WXJPICQY
         vVI05+25+qCCDLZaflrb6bv/wBgMo6prOj7/qaiUvQvru0cRAyZJqT9NiuwjNfR7KgF8
         zj2UO1/wJ2J/LYRsqZeIB0JFaGtHv/qvokfeFjEekjbLE53r9j9aHWCRgo61ueyfzFoZ
         PKzkwsL9dSRcHo2yNYg6czOUWqOy17lBLX/45jmExZoJPczoyGRlcW/1By1wJMx85KPw
         4HRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699001717; x=1699606517;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KieNi2VRLuqIWbngtceJ+14hQSrE87wAqVWYboYUpn4=;
        b=eVen7wnyVUExvTQankGPBDjNfGZCZzKVJvbmz4dmjqX1b6hyDUF9Nkwk2tyKEruIwN
         66jzADRNm7+vXJITFWycjLbvV9oO45tUzg0FK4CYOffBVYE2fdqlUu37j4aENRMpb4OB
         2OWBKVIWh3D7OCEPuTAKYHZKifYe85q6Khgh4bXyHr3IEFM4/4lYjmg2eFKQ3jIIj3Jc
         JwkQNX9a0d+GAXObIo7NLVXIv1gv9bEayTBvYtCscjx+zXOlPHkWxcXQLTjo01dw9I09
         P9X62JG7unocQz0Kf0GwMMN/aoGT0FvKbnNujY98ZxBv49Tk5gm2iduzLR1qlBCgRZ7q
         SjdA==
X-Gm-Message-State: AOJu0YyJAD51WyQ9NiShETT0U2E8FXlHNgpQEieAhYqb9HMcxWNtV+dw
	jRcpnb9C7xLtPWxiFNdvxub6Tg==
X-Google-Smtp-Source: AGHT+IEYRvVYkfBTF/mOXtwir2LnzxGG4Rje2WMX1tbKT95meecl682m7l7wZoe8w7hwACwzCgDjfg==
X-Received: by 2002:a2e:ba88:0:b0:2c5:18a9:620b with SMTP id a8-20020a2eba88000000b002c518a9620bmr13056346ljf.23.1699001716954;
        Fri, 03 Nov 2023 01:55:16 -0700 (PDT)
Received: from localhost ([2a01:e0a:448:76e0:d676:8e27:951e:9cf2])
        by smtp.gmail.com with ESMTPSA id k25-20020a05600c1c9900b004067e905f44sm1784917wms.9.2023.11.03.01.55.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Nov 2023 01:55:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Nov 2023 09:55:15 +0100
Message-Id: <CWP1UD343WSC.32F81J6ROV2YO@burritosblues>
Subject: Re: [PATCH v8] rtc: tps6594: Add driver for TPS6594 RTC
From: "Esteban Blanc" <eblanc@baylibre.com>
To: "Andy Shevchenko" <andy.shevchenko@gmail.com>
Cc: <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
 <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <jpanis@baylibre.com>, <jneanne@baylibre.com>, <u-kumar1@ti.com>
X-Mailer: aerc 0.14.0
References: <20231102132616.1130960-1-eblanc@baylibre.com>
 <CAHp75VdvR0H7XVLWGqdZqSgoHprUUPQHGiyWEEaHjTgEbeinqQ@mail.gmail.com>
 <CWOGMAUT9MKY.2IBKELIOR1CF7@burritosblues>
 <CAHp75VdV5A+WpWj2eY9o_2wwPB7GTi6Eig7YyV8urdv1P3utgQ@mail.gmail.com>
In-Reply-To: <CAHp75VdV5A+WpWj2eY9o_2wwPB7GTi6Eig7YyV8urdv1P3utgQ@mail.gmail.com>

On Thu Nov 2, 2023 at 5:46 PM CET, Andy Shevchenko wrote:
> On Thu, Nov 2, 2023 at 6:17=E2=80=AFPM Esteban Blanc <eblanc@baylibre.com=
> wrote:
> > On Thu Nov 2, 2023 at 5:00 PM CET, Andy Shevchenko wrote:
> > > On Thu, Nov 2, 2023 at 3:26=E2=80=AFPM Esteban Blanc <eblanc@baylibre=
.com> wrote:
> > >
> > > > Notes:
> > > >     This patch was picked from a series since there is no dependenc=
y between
> > > >     the two patches.
> > >
> > > Not sure if RTC maintainer uses the b4 tool, but as I said in previou=
s
> > > email for pinctrl change, there is no need to resend. b4 has an
> > > ability to select patches from the series to be applied.
> >
> > Oh that's good to know, I was not aware of that.
> > I resent it because there was some minor nits that I fixed on both
> > patches.
>
> Ah, that was not reflected in the changelog...

Just after the line you quoted, there is "Changes since v7". Maybe I
should have put it near the other ones. Sorry about that.

Best regards,

--=20
Esteban Blanc
BayLibre

