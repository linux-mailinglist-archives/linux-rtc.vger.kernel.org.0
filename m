Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62C4D2BDE8
	for <lists+linux-rtc@lfdr.de>; Tue, 28 May 2019 05:46:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727597AbfE1Dqi (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 27 May 2019 23:46:38 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:38433 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727320AbfE1Dqh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 27 May 2019 23:46:37 -0400
Received: by mail-ed1-f65.google.com with SMTP id f18so519440edf.5;
        Mon, 27 May 2019 20:46:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HciJFsIn393eSXtgEKFfq08975UQNkMkSjbQZHFnn8s=;
        b=CgNuBmZRf4etzeXAyb85X9o2/4WlvImLuepRMt3fFvZ2/64sXyRsJ8CijHvLPlUtiV
         DDgmsIB6zHiYv6H4WCNs+vAub/WkiEy58Fb2SJkworZMsNhwmGEqOH+ieG32wQL2tIw9
         dPjaSX6Zd+CW8x3QD51E9/t6KFt709hcrB0TZry7klXBjsskZaHIjhPxWuvT2n40j8Er
         VWJp2haE1eO9cVKZgNW/dhbf5MJeYbhQdtHyZCCXxxC/k218BRNUeIgMzHShaAsx+2Aa
         ptG6LZBrpwst9/EoPe0BI6hJXiDrQ/Qe26swRrUSzz6q7MRavIvLPXeFLsDC1V2wikun
         IVNw==
X-Gm-Message-State: APjAAAWjyB6qTazoH/EumFKxQ9wIjajz4oik9YVclUsfAboeplaLh852
        b4DS1NR+DCIASgmxP8JnM1jrYdv91vs=
X-Google-Smtp-Source: APXvYqw5HaLIIilu9x7c3GJElbSGu4OnHkvRQrumZ2rHnbecPOyGFHSWhitTx8zaT4LTB1MXla2KGg==
X-Received: by 2002:a50:cac1:: with SMTP id f1mr122084574edi.97.1559015195823;
        Mon, 27 May 2019 20:46:35 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id v2sm3839962eds.69.2019.05.27.20.46.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 May 2019 20:46:35 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id f8so18553097wrt.1;
        Mon, 27 May 2019 20:46:35 -0700 (PDT)
X-Received: by 2002:adf:f946:: with SMTP id q6mr1107436wrr.109.1559015195243;
 Mon, 27 May 2019 20:46:35 -0700 (PDT)
MIME-Version: 1.0
References: <290402405a34506997fd2fab2c4c1486dbe6b7e5.1558958381.git-series.maxime.ripard@bootlin.com>
 <9b447096c79c8660970013068457c05cb03f9027.1558958381.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <9b447096c79c8660970013068457c05cb03f9027.1558958381.git-series.maxime.ripard@bootlin.com>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Tue, 28 May 2019 11:46:25 +0800
X-Gmail-Original-Message-ID: <CAGb2v65BvcNf7_oCBBaaS8mUCRu7vYR+vF62wffkMGraJuogJQ@mail.gmail.com>
Message-ID: <CAGb2v65BvcNf7_oCBBaaS8mUCRu7vYR+vF62wffkMGraJuogJQ@mail.gmail.com>
Subject: Re: [PATCH 07/10] ARM: dts: sun6i: Fix RTC node
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
> The RTC node doesn't match what is described in the binding for historical
> reasons. Let's add the proper description.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
