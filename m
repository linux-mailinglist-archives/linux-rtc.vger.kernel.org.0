Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2F233C1E94
	for <lists+linux-rtc@lfdr.de>; Fri,  9 Jul 2021 06:45:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbhGIEsQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 9 Jul 2021 00:48:16 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:51559 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229576AbhGIEsP (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 9 Jul 2021 00:48:15 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id D36FF320084E;
        Fri,  9 Jul 2021 00:45:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 09 Jul 2021 00:45:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=traverse.com.au;
         h=from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=mIyVDj+z5tzU60EY8rgjUDBXC0
        HP2ZIeBXKfQ7Gbn3A=; b=bJWd6jq9ex8YOhyZKthMV7CRSPKIRmV9W7mENirzjL
        jWT705wUIU/0DSe3oD1GDGuc7eiil1ZXovQMWitEItbH2B3lalQsI9LM2ESkHgUM
        5kMUCqfn/s/yrWqGp/h+cSQRwX/dylE4Vqc2SDzIaEINt4I28fVb04AlHQc3qOgI
        crk88UDYsQ2v2/1fueLM2H02T5Iscv0pwPuZq0aEbtwvP/ZLzeliSTWhtRtmjXZ9
        YUcIOpOYZCf6yFsXjbqtlZnv9MJL+36ryoT90Fg8NWxJziC3H4hSsAAfF+C+HzMP
        4s3pYdvx79WIkFh3G4XcZyzc9IYLLFQ8ha2dex6GxWFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=mIyVDj+z5tzU60EY8
        rgjUDBXC0HP2ZIeBXKfQ7Gbn3A=; b=bn8jFu2lVMO7HruWvN7M300Hpx8VFklbw
        WSRRNH5vyfOA1X+djZp6/R0dt/dATlucbFe8FTwehmEII3Wx1m6agxbwqpYyeo6W
        3B0GueDCdrU48Co3exPGDS8OmcmSR4EJFVLIA2q8IlicAqvdipSRXENifOBK4E+1
        Dw5+fdXzEg9NMMTk7+9S8e2zZ3pcjYNyGBZBvhPu1UUZyrE/GvwRr0JB22ZUuk5e
        2kRBmOXuaKy4JHXg7nyfyRCZu5AYKwWG5NMdLy09/lF2ak0fmxGuZsVEiOlNzjRh
        tRKbKyhi3ComXV1tEOqVdU24a9jZGZjf9m/P+bn3bMUt9QB29Zy2w==
X-ME-Sender: <xms:a9TnYEfatWTdhd1SCAQbGPBjmJq8JqNFt3YPjjHSYeUQExFlT-NNbg>
    <xme:a9TnYGPW81Zk7SVaMi8HOr0nCPf3nu-5SHawb6Ye9BaPII3tGroQPpvqAIGFDPcs3
    MzMLzuXAux2rTcYbXY>
X-ME-Received: <xmr:a9TnYFiSE43L0KkuRV1fHkrSLzoiKRXrZAX0N_uXQPu9XtB07OXUG8zewPpy_CUgecp_2QlK4iWqC5BL-3vACn9zTX0nZdhQHRjEd9zbJH2Mi-b5T28de2CjQ5I7hhU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdehgdehkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrthhhvgifucfo
    tgeurhhiuggvuceomhgrthhtsehtrhgrvhgvrhhsvgdrtghomhdrrghuqeenucggtffrrg
    htthgvrhhnpeehgeekkedtgefgueekjeetfeeujefhffdvgefhtefgveelkeegvdekuddu
    veevffenucffohhmrghinhepvghpshhonhguvghvihgtvgdrtghomhenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghtthesthhrrghvvghr
    shgvrdgtohhmrdgruh
X-ME-Proxy: <xmx:a9TnYJ_L0yQortW87tuE0fB051cuYs8dutPjrONWWMQlmHEhg6tHnw>
    <xmx:a9TnYAtR9stnSoYrvEZMVOJCUaAKcV1NjPj3Xv7e2DtyXH2FzqlAvQ>
    <xmx:a9TnYAEAu-WfqDAsB-r1_eAJj19vtdbxK4EscvaazcXiLX6pemZkpg>
    <xmx:a9TnYCLy6AJJFx450sWFSsN9bCXLS_fs7f4_RDQ9CgC6yyO4c3dgwA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Jul 2021 00:45:29 -0400 (EDT)
From:   Mathew McBride <matt@traverse.com.au>
To:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Mathew McBride <matt@traverse.com.au>
Subject: [PATCH v2 0/2] rtc: Implement support for EPSON RX-8035
Date:   Fri,  9 Jul 2021 04:45:16 +0000
Message-Id: <20210709044518.28769-1-matt@traverse.com.au>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The EPSON RX-8035[SA] is a I2C real time clock module with
built-in oscillator[1]. It is a very close relative of the EPSON
RX-8025 that is supported by the rtc-rx8025 driver.

The main difference is that the RX-8035 has inverted the
'oscillator stop' bit in the control register. The operation
of the devices is otherwise identical for the features currently
supported.

Curiously, the RX-8025 is also supported by the ds1307 driver
as the time register set is compatible. The control registers,
however, are not.

I have decided to implement the RX-8035 in rtc-rx8025 due the simplicity
of that driver.

As best as I can determine, the rtc-rx8025 driver was in the tree
some months[1] before rx8025 support was added to ds1307[2].

[1] - https://www5.epsondevice.com/en/products/rtc/rx8035sa.html
[2] - commit 3c2b9075cbdb541dbe486bde45925c9610de6f35
[3] - commit a216685818a54b4f15235068b53908f954850251

Changes in v2:
Coding style fixes as per suggestions
Use 'model' instead of 'type' in drvdata
Call rx8025_is_osc_stopped in a consistent manner

Mathew McBride (2):
  rtc: rx8025: implement RX-8035 support
  dt-bindings: rtc: add Epson RX-8025 and RX-8035

 .../devicetree/bindings/rtc/trivial-rtc.yaml  |  3 +
 drivers/rtc/rtc-rx8025.c                      | 59 +++++++++++++++++--
 2 files changed, 57 insertions(+), 5 deletions(-)

-- 
2.30.1

