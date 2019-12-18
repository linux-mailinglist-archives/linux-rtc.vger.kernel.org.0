Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94A69125753
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Dec 2019 00:03:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbfLRXDa (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 18 Dec 2019 18:03:30 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:43290 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbfLRXDa (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 18 Dec 2019 18:03:30 -0500
Received: by mail-oi1-f195.google.com with SMTP id x14so2085939oic.10
        for <linux-rtc@vger.kernel.org>; Wed, 18 Dec 2019 15:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GUm34jx16buWRyV3svW3C32Bv9uGnUFX/okiYBlIAk4=;
        b=sz2qn7j6Ev2BHuVjbBUQV/UcR8qOYoimd8eK3XgQ4D92XB60ZAy8X5SW9GXluwCsJH
         ffFfeUAKxUpDYHDMioXVMiLOP60tIefWYbJuqCoN42xVSLajfjwUQlvUHYRzCNaLMczG
         ni5AWAoaFRMzWfFYwL7KSwHerHpiwvX6p5+mhQPm0ZcDOv1zxFUiFYcBgFZ81UMbEc8e
         MS/lSKGAHVMTX8tHNy0/hCL67CBaSn49xBEiRE0B1Bjwc9Va8ziBEK6f0J5GhYAV/qRe
         HUPVRzyjq/UuXc3FTvf4i9PfP1KB9+zfLcZFmMxD5YuQioKvYjb6ywN4dscil2DYWKMp
         8aGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GUm34jx16buWRyV3svW3C32Bv9uGnUFX/okiYBlIAk4=;
        b=ievNJ6zF5LvngEds6vMu+Spczwm3+cJtbemoFJBZBFo+jK23fpdbUFZNnIAlA0asOx
         qN5dVoouFKSCzatUlk1SIrj5QhZS6JE5e0dzbwmdYWqTE8HGWXOC/c5KAj/DVPUIvio4
         fytBxh8gq3APe46YoaSUncXqxGN5HU+RfMmtHUHwNTCBfXEFHLmWtUYRmDx7XHHR7F1+
         MXKPpy95d3rKOo5wrHgL+CFmTJMZKRD8PPFrXcwGYIwQwhMKHnm3csMd8a8maxAkpe/l
         STf+p5wRWZk3mstBwf1hRbcZFrr0DZpoNgNx+DYgDzMNJ+z2sg/GHIBF62ChxYECfSbz
         LBiQ==
X-Gm-Message-State: APjAAAUfp3NImEAYl/RbQZl3z3ZLTe1lEAVN88YCw3pspenbhQqK/5k7
        IgQFj9ljt9P58XNeVRXs8s0TELqvzxa8l1JnF2nI
X-Google-Smtp-Source: APXvYqzweX03urkXowNACnsWIp55n3aMVeuRU/FTkbIXToumpyKGXCe3Fl63k1tU70eHfIDV1Ak3+JBj40Q86EV+WWA=
X-Received: by 2002:a54:4716:: with SMTP id k22mr1579664oik.36.1576710209917;
 Wed, 18 Dec 2019 15:03:29 -0800 (PST)
MIME-Version: 1.0
References: <20191218082604.3309606-1-iwamatsu@nigauri.org> <20191218091508.GH695889@piout.net>
In-Reply-To: <20191218091508.GH695889@piout.net>
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date:   Thu, 19 Dec 2019 08:03:02 +0900
Message-ID: <CABMQnV+n2jeWpfp7nu6HNtDGDh1m2o4wGEhwh-dFD=w3xboF7Q@mail.gmail.com>
Subject: Re: [PATCH] rtc: pcf8563: Replace i2c functions for smbus ones
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Alessandro Zummo <a.zummo@towertech.it>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

2019=E5=B9=B412=E6=9C=8818=E6=97=A5(=E6=B0=B4) 18:15 Alexandre Belloni <ale=
xandre.belloni@bootlin.com>:
>
> Hi,
>
> On 18/12/2019 17:26:04+0900, Nobuhiro Iwamatsu wrote:
> > From: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> >
> > The driver used i2c_transfer methods to read and set date/time. The smb=
us
> > methods should be used.
> > This commit replaces i2c_transfer functions by i2c_smbus_read/write_xxx
> > for reading and setting the datetime.
> >
>
> Could you instead use regmap?

Yes, I will resend patch using regmap.

Best regards,
  Nobuhiro
