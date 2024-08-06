Return-Path: <linux-rtc+bounces-1667-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D729496DD
	for <lists+linux-rtc@lfdr.de>; Tue,  6 Aug 2024 19:32:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9D591C2251B
	for <lists+linux-rtc@lfdr.de>; Tue,  6 Aug 2024 17:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95C594D9FE;
	Tue,  6 Aug 2024 17:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YSRolU2z"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DA03C08A;
	Tue,  6 Aug 2024 17:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722965575; cv=none; b=QamZygQyQfUR69C7f48ISj+SdmunMGGrPVt2C4q6ZZEWSqXYPvsaRTFnT1fJ8LmC5B+SMSMw+/x4f6ElPKFuuCNS8dyUuGCYOsUaJXSIVHyPx4utYD4pOJNA4cMWMmtD9igfbJZJODh3Cw7f6jHojemY2pRgRgzOsfOznVclSG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722965575; c=relaxed/simple;
	bh=iYGx1LftSjngQ6YEqIPXIbwfGvux/WnzXNe7WghOVlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VH7SI0M2xTS7sNaGeHZtiGSlBqomxyorGu5hl5fLsoeyAUfrq6mcanVN1OicQoEuFjwxq+62ayzfSPe7pRA41dF2PNDWbmo3/SdrEZxk0PDkY/gtLT6MSPTM7XpyvQNW6rEG5Q3GiQDlpnAV9MxJq6FVUG1MIQZAhQNHCT+zEmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YSRolU2z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B09DDC32786;
	Tue,  6 Aug 2024 17:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722965574;
	bh=iYGx1LftSjngQ6YEqIPXIbwfGvux/WnzXNe7WghOVlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YSRolU2zH2EXyoEKYdK4iTJWVOBDCHAhiP61kWYWoYXFAWuAiAAE1gfUqUKRTL3E4
	 BD+Z8W+nxXi5TFO4JKA8IHcSMO1+Fm9AGcGhFMOphWpa4s6QkgkE/xDmMd9Wxdn0+a
	 //FemNjLpovl+nKy9kIVH7zhzA7Wqna2fnxm9c9/gvaXK1UsI6rOy/ILtRjEXpwUm4
	 0E1g+WCkrznvUD5LxLfL84pcfs3KxDYrrKb72k3AQ4TFMqnn3/mJWE8IEeDRcNz21D
	 jSx+G4jlBfnVtyZ1krabkEzG3z72jcldCz2/d5FlUE1oUAw6jrJC7acuFc0TuWA4B7
	 3dfp29BjPG2sw==
Date: Tue, 6 Aug 2024 11:32:53 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	christophe.leroy@csgroup.eu, devicetree@vger.kernel.org,
	conor+dt@kernel.org, linux-rtc@vger.kernel.org, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, alexandre.belloni@bootlin.com,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v4 1/1] dt-bindings: soc: fsl: Convert rcpm to yaml format
Message-ID: <172296557246.1846723.1942293394651649986.robh@kernel.org>
References: <20240802152219.2740137-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240802152219.2740137-1-Frank.Li@nxp.com>


On Fri, 02 Aug 2024 11:22:19 -0400, Frank Li wrote:
> Convert dt-binding rcpm from txt to yaml format.
> Add fsl,ls1028a-rcpm compatible string.
> 
> Additional changes:
> - Add missed compatible string fsl,<chip>-rcpm.
> - Remove map fsl,<chip>-rcpm to fsl,qoriq-rcpm-<version>.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v3 to v4
> - Add missed fsl,ls1088a-rcpm, fsl,ls208xa-rcpm, fsl,lx2160a-rcpm
> 
> Chagne from v2 to v3
> - fallback use const
> - order as fallback compatible string
> - remove minItems for compatible string
> - Fix typo 1045a
> 
> Change from v1 to v2
> - add missed compatible string
> - Remove compatible string map table
> - use oneof Item to align compatible string map table
> ---
>  .../bindings/rtc/fsl,ls-ftm-alarm.yaml        |  2 +-
>  .../devicetree/bindings/soc/fsl/fsl,rcpm.yaml | 96 +++++++++++++++++++
>  .../devicetree/bindings/soc/fsl/rcpm.txt      | 69 -------------
>  3 files changed, 97 insertions(+), 70 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
>  delete mode 100644 Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> 

Applied, thanks!


