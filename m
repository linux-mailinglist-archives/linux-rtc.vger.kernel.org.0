Return-Path: <linux-rtc+bounces-2091-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB3098E8D0
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Oct 2024 05:27:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96CEDB25BFF
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Oct 2024 03:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A7A11EA80;
	Thu,  3 Oct 2024 03:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dRFUVKnE"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B6017C77;
	Thu,  3 Oct 2024 03:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727926063; cv=none; b=UOWss8dKCzPGSoBxwPsW64pzhV1/EMGXuGSWsKjzcsMRmjvjtghWx9UizuPKUpEcBu/92Zi3JlsKVoh0AoSYHwgPTv/Ta7QfTU+6ESaDQFyk/rmTmGZU0n79IqJdXthtTdbQHCEsWxhZXX2KqVxfEWCtxaTg0wKAU7qSSnNEAvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727926063; c=relaxed/simple;
	bh=o+3jrKW7b7kFBJRKWePVxzV/UhWLYrB9mPeX8rVWu+g=;
	h=Message-Id:From:Subject:Date:To:Cc; b=pyy4w1rEPK2hGZcn+8q1w9s23iFVfvbZSTFbKAc9+OgrxPT5C/ctEvlXcoExhgYAFDiqt9J/XF8GBrU4IhBZSfq7LZbBlT1TIXv9cgHr+wvoa2EGOKQ2P7YtJhMtBfHN1GH22mKqD3cqhwO2j1y1uszGo/jyuZEzA49lKON5PUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dRFUVKnE; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id AA20B13804B7;
	Wed,  2 Oct 2024 23:27:39 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 02 Oct 2024 23:27:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1727926059; x=1728012459; bh=JxvPYPBns9YkU
	mhU8vnRGYX0kJFFoS3PbWqDIlFrT5Q=; b=dRFUVKnEQOmDWF0lTtzX+fZRgxh4x
	LibkEdnyf+rDtEuNiiUB0xZjdlTRfoWD3/ppVH6fUjYqwxCKN7GmBlUNTDJK6I2f
	iPrp3B4UqpWfl/1NFP6iuE62COdfx/6Y1NUgRSgiKPuKTibO3ka7OkqQegZdkQGb
	CNbWM8VOhvLsHS+W8YsttkMpQOYdPBCjsuDgzcequGUmIuFyNGjVU6QXpNwF6Qk2
	PCpcBtTROSv2Dhphq/VjFJ4nHJosJ57Iem2s86sp5PEsvu21XIHdBIXI38Z0bQX4
	FsPKhWOi7g0K0bGNlH1U7Qie5h1a5dxOWXGS0IpheGUCuRCmoPv4zgVJA==
X-ME-Sender: <xms:Kg_-ZoIsxZoquFVOFDu06PJYqjiA_r-BelkmrEw37DJUzxzV87-hZQ>
    <xme:Kg_-ZoLbvhfgPCNpymRKtYvigEfV4NIrnUKHmjnQatauYhZHCfIL0Mc0CTTd-x6n-
    plVOpWB7S1L2Mkn-jQ>
X-ME-Received: <xmr:Kg_-ZouasqQhQaHQ6kDn0AH_oUC9ec36dIkMCJ9CjpDG_-2ZMJa9jdg4gwhAiE6aIN7uhnLRQCN0LPqFBP69yn4UWhm4-IKVEYo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvtddgjedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepkffhufffvfevsedttdertddttddtnecuhfhrohhm
    pefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqe
    enucggtffrrghtthgvrhhnpeehffdukeetffdutedvffffheegtdetkeekfeevgfeitefh
    vedvtdelhfduudettdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgpdhnsggprhgtphht
    thhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrlhgvgigrnhgurhgvrd
    gsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepghgvvghrtheslhhi
    nhhugidqmheikehkrdhorhhgpdhrtghpthhtohepuggrnhhivghlsedtgidtfhdrtghomh
    dprhgtphhtthhopehprghvohhnvgesrhgvthhrohguvghvrdgtohhmpdhrtghpthhtohep
    lhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqmheikehksehlihhsthhsrdhlihhnuhigqdhmieekkhdrohhrghdprhgt
    phhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Kg_-ZlYb7N13r24bkQPRwOSqd18zLoXBztkdnIPoHM-A8KFifZpLaQ>
    <xmx:Kg_-ZvaroqHXpAAMu1RvrOo7rAajhiuNYkqdsl4Qd58mlVqsiRqLkA>
    <xmx:Kg_-ZhDYcFSoLLjLJqbEeS3eKCmGXsKLCcSmxJvQ5TgiNs4ePoiwNQ>
    <xmx:Kg_-Zlbwh9c_s0YY1jWc49wFuc0chuM-9HfVzKhSPGi1H8hPy3xKcQ>
    <xmx:Kw_-ZkO2vmwKI7WDf4SsTMKIj7mGd69ZSWPYf1PcH_BgKhXFnQbD2zNZ>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Oct 2024 23:27:35 -0400 (EDT)
Message-Id: <cover.1727925802.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH 0/2] 
Date: Thu, 03 Oct 2024 13:23:22 +1000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
    Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daniel Palmer <daniel@0x0f.com>,
    Michael Pavone <pavone@retrodev.com>,
    linux-kernel@vger.kernel.org,
    linux-m68k@lists.linux-m68k.org,
    linux-rtc@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>

This series removes some duplicate RTC driver code. rtc-m48t59 is tweaked
to bring it into equivalence with the RTC drivers in arch/m68k/mvme*.
Then the latter drivers are removed and platform devices added to make use
of the former.

The second patch depends upon the first, which will require some
coordination between the maintainers of the RTC and m68k subsystems.


Finn Thain (2):
  rtc: m48t59: Accommodate chips that lack a century bit
  m68k: mvme147, mvme16x: Adopt rtc-m48t59 platform driver

 arch/m68k/configs/multi_defconfig   |   1 +
 arch/m68k/configs/mvme147_defconfig |   1 +
 arch/m68k/configs/mvme16x_defconfig |   1 +
 arch/m68k/include/asm/mvme147hw.h   |  19 +---
 arch/m68k/include/asm/mvme16xhw.h   |  18 +--
 arch/m68k/mvme147/config.c          |  54 ++++-----
 arch/m68k/mvme16x/Makefile          |   2 +-
 arch/m68k/mvme16x/config.c          |  56 ++++------
 arch/m68k/mvme16x/rtc.c             | 165 ----------------------------
 drivers/rtc/rtc-m48t59.c            |  31 +++---
 10 files changed, 67 insertions(+), 281 deletions(-)
 delete mode 100644 arch/m68k/mvme16x/rtc.c

-- 
2.39.5


