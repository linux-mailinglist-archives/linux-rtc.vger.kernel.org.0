Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDB6C2BDDF
	for <lists+linux-rtc@lfdr.de>; Tue, 28 May 2019 05:45:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727562AbfE1Dpl (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 27 May 2019 23:45:41 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:36955 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727386AbfE1Dpl (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 27 May 2019 23:45:41 -0400
Received: by mail-ed1-f67.google.com with SMTP id w37so29501563edw.4;
        Mon, 27 May 2019 20:45:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qw8JSbDcgOlgQhN7ihWTX0Ajf+/37Qsz4z2IzghfKy0=;
        b=PYUqVnzkSOO0wCA11H+0wjGh8cDI2k5UAMOA7FoBhwckyXQxVpaN6RvVC33jsk3o7T
         ok1OYlCgpn+5+5DsnRW1KiZg52GD1CupMXPKXkTg5SJTfg/kdAiC8qIzokzsHHS+7kpv
         3C0ZhxZuOc/F9uWC01uohm3ceLCybXyKPtTNfAo68Y7h3zLX0qg8sBd+UakYB1bWnW4b
         9tZtKs/fj8buLi5VnZeEFwtlFbmpUo8nr4oDrFE2jCPel8r8RynJK3Iir3NQYinb8i0W
         xGhjyxTGwRx5LZiodLKledVk3NBuJ7UzDX1W2sc9p2N2ygLGQ5ybz89BCk3Go0ip/G39
         PacQ==
X-Gm-Message-State: APjAAAUsWfTR584JKIE/a0NnlkqFb37Pdc8eTkt7wP1P2u/sXwCzXYJQ
        crYsk0aKgtA78V4cvJqxTV3qPTcCh0M=
X-Google-Smtp-Source: APXvYqzlqWopbcUkM56a0F/Vj9tHlZWnoG12OW+GLQYnB/R85x2M2Cedt6HrQmKiCDurAOhmFqndYg==
X-Received: by 2002:a50:a941:: with SMTP id m1mr126739733edc.157.1559015138708;
        Mon, 27 May 2019 20:45:38 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id l19sm3879770edc.84.2019.05.27.20.45.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 May 2019 20:45:38 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id d18so18532151wrs.5;
        Mon, 27 May 2019 20:45:38 -0700 (PDT)
X-Received: by 2002:adf:c98f:: with SMTP id f15mr27531894wrh.279.1559015137997;
 Mon, 27 May 2019 20:45:37 -0700 (PDT)
MIME-Version: 1.0
References: <290402405a34506997fd2fab2c4c1486dbe6b7e5.1558958381.git-series.maxime.ripard@bootlin.com>
 <e345cb06e54ce80db07e96c2cf2ef51794130585.1558958381.git-series.maxime.ripard@bootlin.com>
 <CAGb2v67mXr-V9_EOb7g27rguYJe2OFHoYX8HCnPnSba3AgcVAA@mail.gmail.com>
In-Reply-To: <CAGb2v67mXr-V9_EOb7g27rguYJe2OFHoYX8HCnPnSba3AgcVAA@mail.gmail.com>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Tue, 28 May 2019 11:45:28 +0800
X-Gmail-Original-Message-ID: <CAGb2v64o5tnXrUcUXPpe-TevDo7-UPpmd=_3fv9cBwo+PTgF0w@mail.gmail.com>
Message-ID: <CAGb2v64o5tnXrUcUXPpe-TevDo7-UPpmd=_3fv9cBwo+PTgF0w@mail.gmail.com>
Subject: Re: [PATCH 04/10] dt-bindings: rtc: Convert Allwinner A31 RTC to a schema
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, May 28, 2019 at 11:37 AM Chen-Yu Tsai <wens@csie.org> wrote:
>
> On Mon, May 27, 2019 at 8:00 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> >
> > The newer Allwinner SoCs have an embedded RTC supported in Linux, with a
> > matching Device Tree binding.
> >
> > Now that we have the DT validation in place, let's convert the device tree
> > bindings for that controller over to a YAML schemas.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> Without understanding the full detains of JSON schema, the new description
> looks correct to me.
>
> Acked-by: Chen-Yu Tsai <wens@csie.org>

You should probably mention the R40 compatible was dropped in favor of
the new one in the next patch. Or was that an error?

ChenYu
