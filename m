Return-Path: <linux-rtc+bounces-94-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F437C993C
	for <lists+linux-rtc@lfdr.de>; Sun, 15 Oct 2023 15:55:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8D91281754
	for <lists+linux-rtc@lfdr.de>; Sun, 15 Oct 2023 13:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B43746FCA;
	Sun, 15 Oct 2023 13:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZKncDzAW"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698A16FA3;
	Sun, 15 Oct 2023 13:55:22 +0000 (UTC)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B294FDA;
	Sun, 15 Oct 2023 06:55:20 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c504a5e1deso32379721fa.2;
        Sun, 15 Oct 2023 06:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697378119; x=1697982919; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+nu3q9xetfUZuBGmSKSjg8GptXQiPNikua8+gYwpkQE=;
        b=ZKncDzAWlIvq2GmpGSrjfAuqINPl+FvDXkQv2Em+73xUCQ6j3f1CRBFPH2GTp0jEca
         +5HLfp8cq0BofapnlMXPeVpeemnN7zonqwDVUgzomEOTb/7d1+92Ul/tgKEzbQjiwXIH
         SNQXm21FDZrlR7E4ExU4rUz9EYwp2B+lL9FRBxaHEA4hpHbW8ytHQhKP/HlykcGoFHCf
         /0Wlc4M75UNAQsMjs4nUfVwaBHVaJEyVN9muJoz6EGRBPwVn/jnshwnPDLxCqv0k/x6p
         jcKrTFivOhUSR5a2MprC3DKr3U2zgkG4p2m3egrvTydNg5u6LOx6kRY6eTvvvWIXp007
         j9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697378119; x=1697982919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+nu3q9xetfUZuBGmSKSjg8GptXQiPNikua8+gYwpkQE=;
        b=fsjNodRCogOIhM9NPfvlJFAyJ2Hj6cLSJsya/40BVVYsHsq0h+LIK4H/+ZIJwb5DWy
         utTLHrnaSMkSnr3uK1kbt1qcFUjFbbu7AKlpE1eU/qOOeciuMU4KVnWOL0H1w93LkFNA
         kLTxCD6DJW8nvPL8iHA5MzoTx0+o+OjW3LCxkJ9G2GeP8RjyGiiMuTX6WWqSHRLJDgPX
         Nwcq0efARHlIy5t5GxQkd7L0uKr5TBVp+vymg9uF8wrVSTvOXsnvjhSV4WexXp/cXe+F
         aFV+JhfCjrSVtFkUPbdul/qJGcpZay0G7J2k4XmSkU/KBZHuaBORzAEXa1iMpnYFlRgb
         8Y1A==
X-Gm-Message-State: AOJu0YxYQCZ31pZZm3eCUVqsWD6v7pw5zpADlAXYVmfd95LU3CWkYZzL
	NTj/youy89v/UalY5SJfpdlBavzJVEv58B3FEi5Xg6UKMBo=
X-Google-Smtp-Source: AGHT+IEfZ7cvgrZH1UzPtCzRRkhnrKWh8hqNkVeeXFK7ca5VK0TSV58DyxUiQUgcwGoUdmuKyzoJfHUd4fli02773zM=
X-Received: by 2002:a05:6512:158e:b0:506:899d:1989 with SMTP id
 bp14-20020a056512158e00b00506899d1989mr25089203lfb.44.1697378118570; Sun, 15
 Oct 2023 06:55:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231010-rtc-7301-regwidth-v3-0-ade586b62794@linaro.org>
In-Reply-To: <20231010-rtc-7301-regwidth-v3-0-ade586b62794@linaro.org>
From: Akinobu Mita <akinobu.mita@gmail.com>
Date: Sun, 15 Oct 2023 22:55:06 +0900
Message-ID: <CAC5umyi2QK+R2M3gFpkFu7jy_rwJY9Q5JdHQzLAJssHyhKxLrw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Support byte access in the RTC7301 driver
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Howard Harte <hharte@magicandroidapps.com>, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

2023=E5=B9=B410=E6=9C=8811=E6=97=A5(=E6=B0=B4) 4:42 Linus Walleij <linus.wa=
lleij@linaro.org>:
>
> This augments the Epson RTC7301 driver so that is supports
> both 8bit byte and 32bit word access.

I don't have access to that device anymore, but I think it's a good change.

Reviewed-by: Akinobu Mita <akinobu.mita@gmail.com>

