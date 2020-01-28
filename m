Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17EF114C23D
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Jan 2020 22:31:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgA1Vbj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 28 Jan 2020 16:31:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:48164 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726276AbgA1Vbj (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 28 Jan 2020 16:31:39 -0500
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 951392173E;
        Tue, 28 Jan 2020 21:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580247098;
        bh=bDvbrj5HqQS4LxdXnGh3/qBvEj0B3r+k0fxfqgjnNEk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=DhlQe0yYsNzPEGOQ6FtBPebxqmXg29Ct4xRoaTVAantqXpXAOQ4mdTIp/PxsK7pK+
         JLsqm3ic4YljfVGhHPkLF1OWy+G4pVsBjbBqNRkBcja72Q+BFjMxdD6wshEuPXVpKh
         VHB8l8kAj27GTghln8b3pAQ36mR9IA7xAeP/m/uQ=
Received: by mail-qt1-f169.google.com with SMTP id d5so11557236qto.0;
        Tue, 28 Jan 2020 13:31:38 -0800 (PST)
X-Gm-Message-State: APjAAAVj373WWqk7WwPx/EnwyuapZfGxXNZXoRVC3bHVl6ziLP68QzBM
        zTfe9VW6RjxMH1I2XabKFMrO7TeIZXjtiFWaLg==
X-Google-Smtp-Source: APXvYqxWkIHcvVJIfuUzxpq66Kv+6NHWqXwVkgbo5ATtwgoFYawV0dI911/BBOkiBRV+tueW7NTPn82MDhArlyK/kBU=
X-Received: by 2002:ac8:1415:: with SMTP id k21mr23881163qtj.300.1580247097763;
 Tue, 28 Jan 2020 13:31:37 -0800 (PST)
MIME-Version: 1.0
References: <20200128204200.22201-1-alexandre.belloni@bootlin.com>
In-Reply-To: <20200128204200.22201-1-alexandre.belloni@bootlin.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 28 Jan 2020 15:31:26 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKY8kGZTUpjq_NqrizDX7Jfigno_J8u7HFF4+6FCnJSCg@mail.gmail.com>
Message-ID: <CAL_JsqKY8kGZTUpjq_NqrizDX7Jfigno_J8u7HFF4+6FCnJSCg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: rtc: at91rm9200: document clocks property
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, Jan 28, 2020 at 2:42 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> The clocks property is mandatory, document it.
>
> Reported-by: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  .../devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml         | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>

In the future, please Cc the DT list.

Rob
