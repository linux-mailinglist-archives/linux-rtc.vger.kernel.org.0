Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D259E9AEE3
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2019 14:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392998AbfHWMOu (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 23 Aug 2019 08:14:50 -0400
Received: from mout.gmx.net ([212.227.17.20]:47293 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391421AbfHWMOu (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 23 Aug 2019 08:14:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1566562433;
        bh=ZZeV6qRtSW/Hn8aQJ6GSyIcFFJLdxp8khErjnJb6tDY=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=FBQpYh+kIJbWDHnjvns4r0qIa5UOO4cbX3d0pJfuKJQ5y42tn0Tk1LWViStDHVUJ0
         l8u0uHxjhi1p4zou1hzwKGXjSAzdCGQY2wrJ5xNMe8gJqqMi9fLM1Hi8HCbLuWtPgM
         VE1fJPnOd5+1wXqEm283z06cO2yt5UAm9k/d7yAk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.154.8] ([217.61.154.8]) by web-mail.gmx.net
 (3c-app-gmx-bs11.server.lan [172.19.170.62]) (via HTTP); Fri, 23 Aug 2019
 14:13:53 +0200
MIME-Version: 1.0
Message-ID: <trinity-1f82bff1-535e-47cd-9a2f-8faccb56e356-1566562433314@3c-app-gmx-bs11>
From:   "Frank Wunderlich" <frank-w@public-files.de>
To:     "Hsin-Hsiung Wang" <hsin-hsiung.wang@mediatek.com>
Cc:     "Lee Jones" <lee.jones@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Mark Brown" <broonie@kernel.org>,
        "Matthias Brugger" <matthias.bgg@gmail.com>,
        "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
        "Mark Rutland" <mark.rutland@arm.com>,
        "Alessandro Zummo" <a.zummo@towertech.it>,
        srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "Kate Stewart" <kstewart@linuxfoundation.org>,
        "Sean Wang" <sean.wang@mediatek.com>,
        "Liam Girdwood" <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org,
        "Richard Fontana" <rfontana@redhat.com>,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        "Thomas Gleixner" <tglx@linutronix.de>,
        "Eddie Huang" <eddie.huang@mediatek.com>,
        "Hsin-Hsiung Wang" <hsin-hsiung.wang@mediatek.com>,
        linux-rtc@vger.kernel.org,
        =?UTF-8?Q?=22Ren=C3=A9_van_Dorst=22?= <opensource@vdorst.com>
Subject: [BUG] [PATCH v5 02/10] mfd: mt6397: extract irq related code from
 core driver
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 23 Aug 2019 14:13:53 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <1566531931-9772-3-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1566531931-9772-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1566531931-9772-3-git-send-email-hsin-hsiung.wang@mediatek.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:nr4dyiSrd5gDD/bbRxF4ZEMIgz3xepFd/XlrekfNAvjvFi0Rx9xJ40d++NeKsHyt0x2if
 Vsxhi9F2hKxfL2TtgZhz8QB3wGKc7O4PkkNfmHp2rkd+cyNHuOeuvgv4tTWEc5vz/AKmz43rcKVO
 w2jtE9MncIXl4dzU+xzojsi78V+giOD8SsFFuIaVLPsJYTcyUSiy3wte1lI3MMA1l7eViGEXQQXU
 yCKnXLU87YTlbIylJbH+NPl9SoVc0aFsk0n3Hp4z+x5ZYnWHl7jBQ13pt2nLpkqQaYEj6njm7x2i
 +Y=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FnVj54k4t1g=:xdot20YBEqJE3Af3zCaBWN
 Bhkf7wY8DCiRL/dAZBYCJ+tX4aoZA6MWAIBeFyPLOS1gVGIbxCzXRz+7jJbzi3VdLA9lLq9VX
 khKYQ3M03zz3DK/k4cSUE8BNkY5STJDWdOarnUPjWEFbYi1sAIMrxEhc55jbnAKL59/Ek4dl9
 WROreyN+6//0XzUk7kMUjeMmqPwOVKQXW4+xCzS3i8Yh3b2Jv033NVjhDfxHG5BLsJoW6BOcO
 nO+aobMhP5FqUb2aBCnQ9sPjA0Xo9pLiC71DAGgfe6kPNVpeP7Qss6j604hQqk5rTv0UIi6WK
 mR+UddvyW9pHXMhIWZdVnEZ1fAQxXsZdoRKQThlZ1Oz9o8iUca4ES+4R0x89lOMQ4Q4kM9/8H
 Cp1J3hL8C5iVpG5JsNsxqV3BVXZBCYZkpCdB+a6lCjEbkMPoB78sINVR3smTfETnHbq9WkbL0
 EV/uXYkwijeRyfx/7dh++1bj1hKeIaLfrew2OuZWysvrQdgBQxTrlfmWvq1olPIdBqiNB57rj
 oRsUMxl9y9Ol/SJtBbnbnADmPVLNlN+7wgl6WaWyNaBVg/6Gnk2lOf9G5P4zD1MDH6lRJ3vU2
 Un1VhrxjKj6kjzX/bMOI1VupE+fMVk+urJQ3DefrmrYUi88bbyplr1v4M8QpGaZZQM6zEtPhD
 +pVMmTPI6cM2yQC9gSvpZ6ikWI161WUqjQKjzXdXKLxy0Qg==
Content-Transfer-Encoding: quoted-printable
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

this commit breaks mt6323 pmic on BananaPi-R2

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit=
/?id=3Da4872e80ce7d2a1844328176dbf279d0a2b89bdb

resulting in this message in dmesg:

mt6397 1000d000.pwrap:mt6323: unsupported chip: 0x0
and multiple
mtk-cpufreq mtk-cpufreq: failed to initialize dvfs info for cpu0

see discussion here:
http://lists.infradead.org/pipermail/linux-mediatek/2019-August/022505.htm=
l

after reverting this one the errors are gone, please provide a fix

regards Frank


> Gesendet: Freitag, 23. August 2019 um 05:45 Uhr
> Von: "Hsin-Hsiung Wang" <hsin-hsiung.wang@mediatek.com>
> Betreff: [PATCH v5 02/10] mfd: mt6397: extract irq related code from cor=
e driver
>
> In order to support different types of irq design, we decide to add
> separate irq drivers for different design and keep mt6397 mfd core
> simple and reusable to all generations of PMICs so far.
>
> Acked-for-mfd-by: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  drivers/mfd/Makefile            |   3 +-
>  drivers/mfd/mt6397-core.c       | 146 --------------------------------
>  drivers/mfd/mt6397-irq.c        | 181 +++++++++++++++++++++++++++++++++=
+++++++
>  include/linux/mfd/mt6397/core.h |   9 ++
>  4 files changed, 192 insertions(+), 147 deletions(-)
>  create mode 100644 drivers/mfd/mt6397-irq.c

