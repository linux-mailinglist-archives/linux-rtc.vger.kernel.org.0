Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 172703BE374
	for <lists+linux-rtc@lfdr.de>; Wed,  7 Jul 2021 09:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbhGGHUA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 7 Jul 2021 03:20:00 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:51159 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230327AbhGGHUA (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 7 Jul 2021 03:20:00 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id C6DEA5C00EB;
        Wed,  7 Jul 2021 03:17:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 07 Jul 2021 03:17:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=traverse.com.au;
         h=from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=esGftYxYNcMesAngjh6I/3VTeJ
        geY8P/8PQeY3ChE84=; b=i1EZKMBtbkNuLmOx2LzYgbmxttzJyW71oGHQTKuFfU
        tn1/+UTER4a1eXzZEQbR6eC5zFEelrHJUzQHaGKDaP3U34oNZNNFkSXwRqyZEEuj
        /g6zf5H9ACAdgfZ3Hl89OJ5iUkniJiBqWuarVnpSfYGKFty+C6mzdjI9q0fhiNKw
        b2FN5lXsjIt25UD3J+XzClDY+grCQnJncPImPniZt7hdgMm+ZKBxNLD5HMekpyxw
        FVpaZoZAKS+VbMDFIb+Obz4cpVetmwHrq1YjR+6Q+QpwPZDsDUfibPdPJQL/wPxB
        TrQB4KyRQfnC44Wx3+u/MQd+lntJYXogrwP3u6XvXKfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=esGftYxYNcMesAngj
        h6I/3VTeJgeY8P/8PQeY3ChE84=; b=gvPDOoKPUdrSBNZH76NL9krRxSEujCNp/
        pybUsffioBHIt5u1wmD+5FXr1OQ+gGGyakAlGaQARFfJ4IpcXXu9lFZWKQdBJ8Hx
        mah1whrSruCoqlCnWjkVKMeBv0YpPkFvDKvk9MNU5+aefZs11wd3dr7lwbp1KmQj
        ZQO17rMzgXsYcR7NltPvV7Ld3e2I9zpPsbQPKtAOLzlOoLHtHsTFwK8bMsIIKHBK
        6QAkQ8os8RyqmOlpVSblF5y7tVQOiTMLA7qHmHyf3TrcPjtwhSRGZK+mK12CEWp8
        y4w56EE4ox9J9vbtqbG90dS4J/rjTKbGatP2XaMBMxPUOR/D31LDg==
X-ME-Sender: <xms:_1TlYPhGMUsNlPreY4_Q0BTje3-_5WKyMpBnDLJTb0itJlnQoWegGw>
    <xme:_1TlYMAjVA5tfZv8JiD8ZVlNinG1prNnxWcmtSYRJhuJmhqlgOUbv8FST9wxUBIHB
    VZyI6AJYm08fs3CcYM>
X-ME-Received: <xmr:_1TlYPEQUh7IkjLlPxOt6UynExU6rPfv5NAanZnK35GBmwRfvtXbLkyWZTRGrVJ0niQuf5gAODWKhpOYV0_OFE6VdwkkY9np2PUM-J3w4FRb7UHevsjlzy5962DEIys>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddugdekjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrthhhvgifucfo
    tgeurhhiuggvuceomhgrthhtsehtrhgrvhgvrhhsvgdrtghomhdrrghuqeenucggtffrrg
    htthgvrhhnpeehgeekkedtgefgueekjeetfeeujefhffdvgefhtefgveelkeegvdekuddu
    veevffenucffohhmrghinhepvghpshhonhguvghvihgtvgdrtghomhenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghtthesthhrrghvvghr
    shgvrdgtohhmrdgruh
X-ME-Proxy: <xmx:_1TlYMQoOYXXKaLRx8DaLHnCKhfNNdikAw9fFp8YdLOhFgtWDB0iVw>
    <xmx:_1TlYMw36twzt3oRwTshz9cwPWU0zA4CQvPsIT0inYoQ5YDYqKv7Qg>
    <xmx:_1TlYC6m0VaRRmjqvsc2bVmJhaVzn0GIvmr4D-TbZFZWDAxd5sHVrQ>
    <xmx:_1TlYGt9M8CbIOfLK2SwDHozrpxZJPhrZuuFyTF9R58Sg6AV6gH_eA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 03:17:17 -0400 (EDT)
From:   Mathew McBride <matt@traverse.com.au>
To:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Mathew McBride <matt@traverse.com.au>
Subject: [PATCH 0/2] Implement EPSON RX-8035 support
Date:   Wed,  7 Jul 2021 07:16:14 +0000
Message-Id: <20210707071616.28976-1-matt@traverse.com.au>
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

Mathew McBride (2):
  rtc: rx8025: implement RX-8035 support
  dt-bindings: rtc: add Epson RX-8025 and RX-8035

 .../devicetree/bindings/rtc/trivial-rtc.yaml  |  3 +
 drivers/rtc/rtc-rx8025.c                      | 59 +++++++++++++++++--
 2 files changed, 56 insertions(+), 6 deletions(-)

-- 
2.30.1

