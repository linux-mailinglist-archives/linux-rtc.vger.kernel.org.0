Return-Path: <linux-rtc+bounces-2179-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8638B99C613
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Oct 2024 11:42:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AA522873DC
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Oct 2024 09:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 410C3156C5F;
	Mon, 14 Oct 2024 09:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="YwdRrv5A"
X-Original-To: linux-rtc@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4649015667B;
	Mon, 14 Oct 2024 09:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728898906; cv=none; b=oZoOpwJC/g2CBGyNeeJCbFA30kIzGzOg4X+z2cI6Go/hFDfBrtMy/XvlSCzTgfIYWFD1YfrZCumol0oR3Qc9w4FyeCPr7iHX9JL31nEA2TWJoC8OayQXubsJse54qIq5Bx2/TsjVdbEnHeYOmp10yaNd2/RBykXrK3rchYBAOZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728898906; c=relaxed/simple;
	bh=yCGgobmiVdwTNNdbyRmVwVi6Iiw+424PNT5NYttS6ws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QzMiv7CkntzJlnuArRUXduCrAPhHACtYDkGFhNrL0RUsnVqahGC853yNqm5b8WTqd+ct5DIBMdizQtd2x2+wcnxcrFavNZU7szb+RlcwMmAHlPxkThqie0wKiY6XqcxfZ/m/Tyv7IwyiweRL+96MDagGk04/2gSIGrJ421R+S8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=YwdRrv5A; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uLuSOnIKTDUr1b3Y37tkpjiPZ4FItYSw5P1gi506wlo=; b=YwdRrv5A8ufzJdVqzIeRcxOzXo
	qW2QNkcmMiso/Z8yFOHhvo3lImCp5xKMEaWqvowPdATTRFRB3OVeQy3HS7/Cnl+iZWC94/ppF4pBp
	kdlNq8xvMAGSbSJg53X6MDnspg5vIEpFJOAWuppnbVFipl009VCrj4IUBnEeGU1SLdOj9les/Fn1D
	m1D/seHfdRN5sxA2/Rlrs/Gf0Mv/lDGY37t09OxUS4ztr0PX1C8ctJnmwU06uNkE6cUGs+LXzL7jq
	HBH6MzFWUk7kM1OBP2yj9kx1tbK+vJQRpQNf4nknkAzTQms8yRuEdh8TXZtR38K1rzfE5xPBOGVRY
	4zxSl1dw==;
Received: from i53875b34.versanet.de ([83.135.91.52] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t0Ha5-0006uK-H9; Mon, 14 Oct 2024 11:41:37 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: conor+dt@kernel.org,
	Karthikeyan Krishnasamy <karthikeyan@linumiz.com>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	alexandre.belloni@bootlin.com
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH v3 0/6] Add support Relfor Saib board which is based on Rockchip RV1109 SoC
Date: Mon, 14 Oct 2024 11:41:34 +0200
Message-ID: <172889888554.115816.9413952717396718584.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240912142451.2952633-1-karthikeyan@linumiz.com>
References: <20240912142451.2952633-1-karthikeyan@linumiz.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 12 Sep 2024 19:54:45 +0530, Karthikeyan Krishnasamy wrote:
> Rockchip RV1109 is compatible with Rockchip RV1126.
> In this series, adding required missing peripheral in
> RV1126 and its pin mux.
> 
> Relfor Saib board is equipped with 1GB of RAM and 4GB of eMMC
> Pheripherals like Bluetooth 4.2, Wifi 5G, audio-codec,
> ir transmitter and receiver, etc
> 
> [...]

Applied, thanks!

[2/6] ARM: dts: rockchip: Add watchdog node for RV1126
      commit: cbad02491459d64522852da07736ddc1f04cbaef
[4/6] dt-bindings: vendor-prefixes: Add Relfor labs
      commit: d0c9f9b848d0ee57e785c393cd4d618b5753e68d
[5/6] dt-bindings: arm: rockchip: Add Relfor Saib
      commit: c1386c02d5d457a1713c8e866102c4418a1c736c
[6/6] ARM: dts: rockchip: Add Relfor Saib board
      commit: bdb2696ac5786ed3f43520e700347fe2152ea199

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

