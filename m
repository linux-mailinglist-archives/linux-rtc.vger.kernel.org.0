Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E68F2BDEB
	for <lists+linux-rtc@lfdr.de>; Tue, 28 May 2019 05:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727591AbfE1Dr1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 27 May 2019 23:47:27 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:37104 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727320AbfE1Dr1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 27 May 2019 23:47:27 -0400
Received: by mail-ed1-f67.google.com with SMTP id w37so29506603edw.4;
        Mon, 27 May 2019 20:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nf6vYvvBYbn2d1YrRuYhMm050xJbRKaDPXv2H4eHIRY=;
        b=Z4eV4dFMXbppRXXhNV7K81sJn0pXK6FZ/dyr/qb3SNS40fnlO3AEFHdFtm563WjjIL
         FcnJxxkDXEuQBDntxAVnaVrXpygif2cCkLMRl1FoO2GTfPzXhuu2RpPGGIXbSE+xyAGn
         Z/bxFN+pB5rHbqdoI8H+ADbPgmAWCPLdG4e6UAGMH3yvmxojPmw6eiKyKOZth3NBkPJb
         +ZbU2W4Jbwl2zxhnVf0Uvv3Mhw3UBozz4RELTXbYsi1JEbSCcGEivilrBGCcF0KP1Wp/
         ClnoorF+qzYyTx1VkfUQp9HPNH9iyAHn6d+EdI4zLRM23dS5wLN/R77/ya3RhRwPAy0A
         zOUA==
X-Gm-Message-State: APjAAAVentAVNg4t1pnZnlwkr2togGtOvZ2hchv67GCKB0sv8QDg2stk
        VqtGIykFoeFAGMSLprMVVYYhlUoTgVk=
X-Google-Smtp-Source: APXvYqzFmoE6w0eK2XRwerQMs/ztsmAo2ZbE8Dp7AMSvJx/UtYcOLgEPEPzqE8xph6HZPyvWqrS66w==
X-Received: by 2002:a17:906:63c1:: with SMTP id u1mr38240413ejk.173.1559015245112;
        Mon, 27 May 2019 20:47:25 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id z10sm3864012edl.35.2019.05.27.20.47.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 May 2019 20:47:24 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id f8so18554254wrt.1;
        Mon, 27 May 2019 20:47:24 -0700 (PDT)
X-Received: by 2002:adf:9c8a:: with SMTP id d10mr23575243wre.9.1559015244132;
 Mon, 27 May 2019 20:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <290402405a34506997fd2fab2c4c1486dbe6b7e5.1558958381.git-series.maxime.ripard@bootlin.com>
 <632517d48479da8da8f665ed511c24757b6d488e.1558958381.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <632517d48479da8da8f665ed511c24757b6d488e.1558958381.git-series.maxime.ripard@bootlin.com>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Tue, 28 May 2019 11:47:14 +0800
X-Gmail-Original-Message-ID: <CAGb2v65UQtnN-dopOc8AcECFkCVHtaxtjgFiQ0+1OA_VUjKTuA@mail.gmail.com>
Message-ID: <CAGb2v65UQtnN-dopOc8AcECFkCVHtaxtjgFiQ0+1OA_VUjKTuA@mail.gmail.com>
Subject: Re: [PATCH 09/10] ARM: dts: sun8i: v3s: Fix the RTC node
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

On Mon, May 27, 2019 at 8:01 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> For some reason, while the v3s has a dedicated compatible in the RTC
> binding, the one actually used was the A31's. However, it turns out that
> the controller is pretty different (which justified the compatible).
>
> Let's use the proper compatible, and use the proper binding description as
> well.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

You may want to split out the clock-accuracy bits, since they are unrelated.

Otherwise, for both resulting patches,

Acked-by: Chen-Yu Tsai <wens@csie.org>
