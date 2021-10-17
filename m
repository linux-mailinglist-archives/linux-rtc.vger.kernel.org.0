Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E528C430B21
	for <lists+linux-rtc@lfdr.de>; Sun, 17 Oct 2021 19:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbhJQRTi (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 17 Oct 2021 13:19:38 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:35404
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344355AbhJQRTh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 17 Oct 2021 13:19:37 -0400
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D1EFB3FFFC
        for <linux-rtc@vger.kernel.org>; Sun, 17 Oct 2021 17:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634491046;
        bh=eVflprpswMNhSOShQaGnMDCR95Lqa8YXm16PQlN3/zc=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=hZoMYaydGL0F06I/pOOLJa/6BxmrTRx12KrHpTbSNpq95VCYCAH3QXRV9hiRrvQVr
         1hwVdgIgtlZUVr19ibMzqmhtRUTTqTa0JRvHu9rQ60iw/ai5xMdsGAt8T1c2hjsu3c
         VKJ3Zk+rv5MV3oTe00MFKdblr1/TBYdvqz9ISHTXPsAhQCIFIG9DxsYEkgp/r1AloV
         CZKKdRxYX5WaBDEUIhPj34gPNpy0Xr/zgZlIhAErK8SAMOoPfSuigE9zYDsRM+OtMs
         9Xfk2PAD/kpCxWHbsiuW81wxoxem1Nu0p6mzM3ZF9Z36CBATYRQ/gBYpZGOXmW5McD
         mVu24f+e5id/w==
Received: by mail-lj1-f200.google.com with SMTP id v13-20020a2e2f0d000000b0021126b5cca2so544033ljv.19
        for <linux-rtc@vger.kernel.org>; Sun, 17 Oct 2021 10:17:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eVflprpswMNhSOShQaGnMDCR95Lqa8YXm16PQlN3/zc=;
        b=JO5RSLVC34tWDuuVxlD+28JrWIi0yed5CBb/Cl7DaMi7mysjWwy1h67c1OJQ5u8DOX
         exXpvoeAuehq1maL+JjLPMPoY/CjPYlsWp4lpBO8vAK/qoSBGhP+YtUI/8QjOyti5H+U
         dcDT9BonYk953u2aE2d9P+tqd35i645uceWoAgvU1JwS/Zfnhdqqv/G4xIZU1ZB5mc+t
         yCeyQ1UNyde0cGaZVJWoY5d16Mh10NS2TxWKYBjdj99altYCEIsWS1RyGdWP8GNNmmFB
         lN6Cq86YBvmed7FsUvO9zLsU3AkH2ZjbYshbKyMwiz33gLu5bUEpkKf3o5ahZCEjxg0k
         rC3g==
X-Gm-Message-State: AOAM531KrEDxBgKTzzjcxt09Z1Gu4Lnp7FvSGJeYagq+Y2saYO1fzEyL
        duj8lk844vObmBAJKN2clEtodom7lv/7/1PlDD9mVtyguRAghvMLBVpIfTlEFzYaSCq6k3fRK5j
        j9TdXsH2Jrg8E3fNVBLWtZ+7xB54971AFEEVV5g==
X-Received: by 2002:a05:6512:1024:: with SMTP id r4mr24514276lfr.369.1634491045949;
        Sun, 17 Oct 2021 10:17:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJye9QuKKUoWxFQss3whtnHm3R9a1la2Zo3yqht5gQUUcY0PsrMwRvY7S1sdqpmDQUgCISjEtg==
X-Received: by 2002:a05:6512:1024:: with SMTP id r4mr24514255lfr.369.1634491045791;
        Sun, 17 Oct 2021 10:17:25 -0700 (PDT)
Received: from kozik-lap.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id s17sm1286475lfe.10.2021.10.17.10.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 10:17:24 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will McVicker <willmcvicker@google.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Will Deacon <will@kernel.org>,
        Russell King <linux@armlinux.org.uk>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, kernel-team@android.com,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3] rtc: s3c: remove HAVE_S3C_RTC in favor of direct dependencies
Date:   Sun, 17 Oct 2021 19:17:23 +0200
Message-Id: <163449103927.4649.126852181251730907.b4-ty@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211013212256.3425889-1-willmcvicker@google.com>
References: <20211013212256.3425889-1-willmcvicker@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 13 Oct 2021 21:22:55 +0000, Will McVicker wrote:
> The config HAVE_S3C_RTC is not really needed since we can simply just
> add the dependencies directly to RTC_DRV_S3C. Also, one less config to
> keep track of!
> 
> 

Applied, thanks!

[1/1] rtc: s3c: remove HAVE_S3C_RTC in favor of direct dependencies
      commit: d96890fca9fd429dd3834dae27e1047760da245b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
